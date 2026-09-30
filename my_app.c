#include "sim.h"

#define CX 0 
#define CY 0
#define CZ 1
#define LX 5
#define LY 5
#define LZ 7 
#define FP 1024
#define KA 100
#define KD 850
#define KS 200
#define SHINE 16
#define BG 0x000000
#define NEG_Z (-(1 << 30))
#define WORLD_X (SIM_X_SIZE / 2 - RADIUS_BALL)
#define WORLD_Y (SIM_Y_SIZE / 2 - RADIUS_BALL)
#define WORLD_Z 300
#define RADIUS_PIPE 12
#define RADIUS_BALL 16
#define STEP 4
#define MAX_SIZE 90
#define MIN_SIZE 30
#define PIPES_COUNT 6
#define TOTAL 30

int isqrt(int n) {
    int res = 0;
    int bit = 1 << 30;
    while (bit > n) bit >>= 2;
    while (bit != 0) {
        if (n >= res + bit) {
            n -= res + bit;
            res = (res >> 1) + bit;
        } else {
            res >>= 1;
        }
        bit >>= 2;
    }
    return res;
}

int len(int x, int y, int z) {
    return isqrt(x * x + y * y + z * z);
}

void normalize(int *x, int *y, int *z) {
    int l = len(*x, *y, *z);
    if (l == 0) return;
    *x = (*x * FP) / l;
    *y = (*y * FP) / l;
    *z = (*z * FP) / l;
}

int dot(int x1, int y1, int z1, int x2, int y2, int z2) {
    return (x1 * x2 + y1 * y2 + z1 * z2) / FP;
}

void resetScene(int* zbuf, int color) {
    for (int y = 0; y < SIM_Y_SIZE; y++) {
        for (int x = 0; x < SIM_X_SIZE; x++) {
            zbuf[y * SIM_X_SIZE + x] = NEG_Z;
            simPutPixel(x, y, color);
        }
    }
}

int inWorld(int x, int y, int z) {
    return (x >= -WORLD_X && x <= WORLD_X &&
            y >= -WORLD_Y && y <= WORLD_Y &&
            z >= -WORLD_Z && z <= WORLD_Z);
}

int stepX(int d) {
    if(d == 0) return 1;
    if (d == 1) return -1;
    return 0;
}

int stepY(int d) {
    if(d == 2) return 1;
    if (d == 3) return -1;
    return 0;
}

int stepZ(int d) {
    if(d == 4) return 1;
    if (d == 5) return -1;
    return 0;
}

int pickDir(int prev) {
    int dir;
    do {
        dir = simRand() % 6;
    } while(dir == (prev ^ 1));
    return dir;
}

void drawSphere(int* zbuf, int cx, int cy, int r, int cz, int color) {
    int lx = LX, ly = LY, lz = LZ;
    normalize(&lx, &ly, &lz);
    int vx = CX, vy = CY, vz = CZ;
    normalize(&vx, &vy, &vz);
    int hx = vx + lx, hy = vy + ly, hz = lz + vz;
    normalize(&hx, &hy, &hz);
    for (int i = -r; i <= r; i++) {
        int x = cx + i;
        if (x < 0 || x >= SIM_X_SIZE) continue;
        for (int j = -r; j <= r; j++) {
            int y = cy + j;
            if (y < 0 || y >= SIM_Y_SIZE) continue;

            if (i * i + j * j > r * r) continue;
            int nz = isqrt(r * r - i * i - j * j);
            int z = cz + nz;
            int idx = y * SIM_X_SIZE + x;
            if (zbuf[idx] >= z) continue;
            zbuf[idx] = z;
            int nx = i, ny = j;
            normalize(&nx, &ny, &nz);
            int ndotl = dot(nx, ny, nz, lx, ly, lz);
            if(ndotl < 0) ndotl = 0;
            int ndoth = dot(nx, ny, nz, hx, hy, hz);
            if(ndoth < 0) ndoth = 0;
            int ambient = KA;
            int diffuse = (KD * ndotl) / FP;
            int spec_pow = FP;
            for (int k = 0; k < SHINE; k++) 
                spec_pow = (spec_pow * ndoth) / FP;
            int specular = (KS * spec_pow) / FP;
            int intensity = ambient + diffuse;
            int r = ((color >> 16) & 0xFF) * intensity / FP + specular;
            int g = ((color >> 8) & 0xFF) * intensity / FP + specular;
            int b = (color & 0xFF) * intensity / FP + specular;
            if (r > 255) r = 255; if (r < 0) r = 0;
            if (g > 255) g = 255; if (g < 0) g = 0;
            if (b > 255) b = 255; if (b < 0) b = 0;
            int res = (r << 16) | (g << 8) | b;
            simPutPixel(x, y, res);
        }
    }
}

void spawn(int* pp) {
    pp[0] = -WORLD_X + simRand() % (2 * WORLD_X);
    pp[1] = -WORLD_Y + simRand() % (2 * WORLD_Y);
    pp[2] = -WORLD_Z + simRand() % (2 * WORLD_Z);
    pp[3] = simRand() % 6;
    pp[4] = MIN_SIZE + simRand() % (MAX_SIZE - MIN_SIZE + 1);
    pp[5] = 0x202020 + simRand() % 0xDFDFDF;
    pp[6] = 1;
}

void app(void) {
    int zbuf[SIM_X_SIZE * SIM_Y_SIZE];
    int pipes[PIPES_COUNT * 7];
    
    while(1) {
        resetScene(zbuf, BG);
        int spawned = PIPES_COUNT;
        for(int p = 0; p < PIPES_COUNT; ++p) spawn(pipes + p * 7);
        int alive = PIPES_COUNT;
        while(alive){
            for(int i = 0; i < PIPES_COUNT; ++i) {
            int* pp = pipes + i * 7;
            if(!pp[6]) continue;
            pp[0] += stepX(pp[3]) * STEP;
            pp[1] += stepY(pp[3]) * STEP;
            pp[2] += stepZ(pp[3]) * STEP;
            if(!inWorld(pp[0], pp[1], pp[2])) {
                if(spawned < TOTAL) {
                    spawn(pp);
                    spawned++;
                } else {
                    pp[6] = 0;
                    --alive;
                }
                continue;
            }
            int cx = SIM_X_SIZE / 2 + pp[0];
            int cy = SIM_Y_SIZE / 2 + pp[1];
            drawSphere(zbuf, cx, cy, RADIUS_PIPE, pp[2], pp[5]);
            pp[4] -= STEP;
            if(pp[4] <= 0) {
                pp[3] = pickDir(pp[3]);
                drawSphere(zbuf, cx, cy, RADIUS_BALL, pp[2], pp[5]);
                pp[4] = MIN_SIZE + simRand() % (MAX_SIZE - MIN_SIZE + 1);
            }
        }
        simFlush();
    }
        
    for (int f = 0; f < 300; ++f) simFlush();
    }
}



