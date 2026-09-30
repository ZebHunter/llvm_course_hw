; ModuleID = 'my_app.c'
source_filename = "my_app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @isqrt(i32 noundef %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %2, %1
  %3 = phi i32 [ 1073741824, %1 ], [ %5, %2 ]
  %4 = icmp sgt i32 %3, %0
  %5 = lshr i32 %3, 2
  br i1 %4, label %2, label %6, !llvm.loop !5

6:                                                ; preds = %2
  %7 = icmp eq i32 %3, 0
  br i1 %7, label %21, label %8

8:                                                ; preds = %6, %8
  %9 = phi i32 [ %19, %8 ], [ %3, %6 ]
  %10 = phi i32 [ %18, %8 ], [ 0, %6 ]
  %11 = phi i32 [ %16, %8 ], [ %0, %6 ]
  %12 = add nsw i32 %9, %10
  %13 = icmp slt i32 %11, %12
  %14 = ashr i32 %10, 1
  %15 = select i1 %13, i32 0, i32 %12
  %16 = sub nsw i32 %11, %15
  %17 = select i1 %13, i32 0, i32 %9
  %18 = add nsw i32 %17, %14
  %19 = lshr i32 %9, 2
  %20 = icmp ult i32 %9, 4
  br i1 %20, label %21, label %8, !llvm.loop !7

21:                                               ; preds = %8, %6
  %22 = phi i32 [ 0, %6 ], [ %18, %8 ]
  ret i32 %22
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @len(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = mul nsw i32 %0, %0
  %5 = mul nsw i32 %1, %1
  %6 = add nuw nsw i32 %5, %4
  %7 = mul nsw i32 %2, %2
  %8 = add nuw nsw i32 %6, %7
  br label %9

9:                                                ; preds = %9, %3
  %10 = phi i32 [ 1073741824, %3 ], [ %12, %9 ]
  %11 = icmp ugt i32 %10, %8
  %12 = lshr i32 %10, 2
  br i1 %11, label %9, label %13, !llvm.loop !5

13:                                               ; preds = %9
  %14 = icmp eq i32 %10, 0
  br i1 %14, label %28, label %15

15:                                               ; preds = %13, %15
  %16 = phi i32 [ %26, %15 ], [ %10, %13 ]
  %17 = phi i32 [ %25, %15 ], [ 0, %13 ]
  %18 = phi i32 [ %23, %15 ], [ %8, %13 ]
  %19 = add nsw i32 %17, %16
  %20 = icmp slt i32 %18, %19
  %21 = ashr i32 %17, 1
  %22 = select i1 %20, i32 0, i32 %19
  %23 = sub nsw i32 %18, %22
  %24 = select i1 %20, i32 0, i32 %16
  %25 = add nsw i32 %24, %21
  %26 = lshr i32 %16, 2
  %27 = icmp ult i32 %16, 4
  br i1 %27, label %28, label %15, !llvm.loop !7

28:                                               ; preds = %15, %13
  %29 = phi i32 [ 0, %13 ], [ %25, %15 ]
  ret i32 %29
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @normalize(ptr nocapture noundef %0, ptr nocapture noundef %1, ptr nocapture noundef %2) local_unnamed_addr #2 {
  %4 = load i32, ptr %0, align 4, !tbaa !8
  %5 = load i32, ptr %1, align 4, !tbaa !8
  %6 = load i32, ptr %2, align 4, !tbaa !8
  %7 = mul nsw i32 %4, %4
  %8 = mul nsw i32 %5, %5
  %9 = add nuw nsw i32 %8, %7
  %10 = mul nsw i32 %6, %6
  %11 = add nuw nsw i32 %9, %10
  br label %12

12:                                               ; preds = %12, %3
  %13 = phi i32 [ 1073741824, %3 ], [ %15, %12 ]
  %14 = icmp ugt i32 %13, %11
  %15 = lshr i32 %13, 2
  br i1 %14, label %12, label %16, !llvm.loop !5

16:                                               ; preds = %12
  %17 = icmp eq i32 %13, 0
  br i1 %17, label %42, label %18

18:                                               ; preds = %16, %18
  %19 = phi i32 [ %29, %18 ], [ %13, %16 ]
  %20 = phi i32 [ %28, %18 ], [ 0, %16 ]
  %21 = phi i32 [ %26, %18 ], [ %11, %16 ]
  %22 = add nsw i32 %20, %19
  %23 = icmp slt i32 %21, %22
  %24 = ashr i32 %20, 1
  %25 = select i1 %23, i32 0, i32 %22
  %26 = sub nsw i32 %21, %25
  %27 = select i1 %23, i32 0, i32 %19
  %28 = add nsw i32 %27, %24
  %29 = lshr i32 %19, 2
  %30 = icmp ult i32 %19, 4
  br i1 %30, label %31, label %18, !llvm.loop !7

31:                                               ; preds = %18
  %32 = icmp eq i32 %28, 0
  br i1 %32, label %42, label %33

33:                                               ; preds = %31
  %34 = shl nsw i32 %4, 10
  %35 = sdiv i32 %34, %28
  store i32 %35, ptr %0, align 4, !tbaa !8
  %36 = load i32, ptr %1, align 4, !tbaa !8
  %37 = shl nsw i32 %36, 10
  %38 = sdiv i32 %37, %28
  store i32 %38, ptr %1, align 4, !tbaa !8
  %39 = load i32, ptr %2, align 4, !tbaa !8
  %40 = shl nsw i32 %39, 10
  %41 = sdiv i32 %40, %28
  store i32 %41, ptr %2, align 4, !tbaa !8
  br label %42

42:                                               ; preds = %16, %31, %33
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @dot(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) local_unnamed_addr #3 {
  %7 = mul nsw i32 %3, %0
  %8 = mul nsw i32 %4, %1
  %9 = add nsw i32 %8, %7
  %10 = mul nsw i32 %5, %2
  %11 = add nsw i32 %9, %10
  %12 = sdiv i32 %11, 1024
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define dso_local void @resetScene(ptr nocapture noundef writeonly %0, i32 noundef %1) local_unnamed_addr #4 {
  br label %3

3:                                                ; preds = %2, %9
  %4 = phi i64 [ 0, %2 ], [ %10, %9 ]
  %5 = mul nuw nsw i64 %4, 1536
  %6 = getelementptr i32, ptr %0, i64 %5
  %7 = trunc i64 %4 to i32
  br label %12

8:                                                ; preds = %9
  ret void

9:                                                ; preds = %12
  %10 = add nuw nsw i64 %4, 1
  %11 = icmp eq i64 %10, 768
  br i1 %11, label %8, label %3, !llvm.loop !12

12:                                               ; preds = %3, %12
  %13 = phi i64 [ 0, %3 ], [ %16, %12 ]
  %14 = getelementptr i32, ptr %6, i64 %13
  store i32 -1073741824, ptr %14, align 4, !tbaa !8
  %15 = trunc i64 %13 to i32
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %7, i32 noundef %1) #8
  %16 = add nuw nsw i64 %13, 1
  %17 = icmp eq i64 %16, 1536
  br i1 %17, label %9, label %12, !llvm.loop !13
}

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef i32 @inWorld(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #3 {
  %4 = add i32 %0, 752
  %5 = icmp ult i32 %4, 1505
  %6 = add i32 %1, 368
  %7 = icmp ult i32 %6, 737
  %8 = and i1 %5, %7
  %9 = add i32 %2, 300
  %10 = icmp ult i32 %9, 601
  %11 = and i1 %8, %10
  %12 = zext i1 %11 to i32
  ret i32 %12
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef i32 @stepX(i32 noundef %0) local_unnamed_addr #3 {
  %2 = icmp eq i32 %0, 1
  %3 = sext i1 %2 to i32
  %4 = icmp eq i32 %0, 0
  %5 = select i1 %4, i32 1, i32 %3
  ret i32 %5
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef i32 @stepY(i32 noundef %0) local_unnamed_addr #3 {
  %2 = icmp eq i32 %0, 3
  %3 = sext i1 %2 to i32
  %4 = icmp eq i32 %0, 2
  %5 = select i1 %4, i32 1, i32 %3
  ret i32 %5
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef i32 @stepZ(i32 noundef %0) local_unnamed_addr #3 {
  %2 = icmp eq i32 %0, 5
  %3 = sext i1 %2 to i32
  %4 = icmp eq i32 %0, 4
  %5 = select i1 %4, i32 1, i32 %3
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define dso_local i32 @pickDir(i32 noundef %0) local_unnamed_addr #4 {
  br label %2

2:                                                ; preds = %2, %1
  %3 = tail call i32 (...) @simRand() #8
  %4 = srem i32 %3, 6
  %5 = xor i32 %4, %0
  %6 = icmp eq i32 %5, 1
  br i1 %6, label %2, label %7, !llvm.loop !14

7:                                                ; preds = %2
  ret i32 %4
}

declare i32 @simRand(...) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @drawSphere(ptr nocapture noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) local_unnamed_addr #4 {
  %7 = sub nsw i32 0, %3
  %8 = icmp slt i32 %3, 0
  br i1 %8, label %16, label %9

9:                                                ; preds = %6
  %10 = mul nsw i32 %3, %3
  %11 = lshr i32 %5, 16
  %12 = and i32 %11, 255
  %13 = lshr i32 %5, 8
  %14 = and i32 %13, 255
  %15 = and i32 %5, 255
  br label %17

16:                                               ; preds = %163, %6
  ret void

17:                                               ; preds = %9, %163
  %18 = phi i32 [ %7, %9 ], [ %164, %163 ]
  %19 = add nsw i32 %18, %1
  %20 = icmp ugt i32 %19, 1535
  br i1 %20, label %163, label %21

21:                                               ; preds = %17
  %22 = mul nsw i32 %18, %18
  %23 = shl nsw i32 %18, 10
  br label %24

24:                                               ; preds = %21, %160
  %25 = phi i32 [ %7, %21 ], [ %161, %160 ]
  %26 = add nsw i32 %25, %2
  %27 = icmp ugt i32 %26, 767
  br i1 %27, label %160, label %28

28:                                               ; preds = %24
  %29 = mul nsw i32 %25, %25
  %30 = add nuw nsw i32 %29, %22
  %31 = icmp ugt i32 %30, %10
  br i1 %31, label %160, label %32

32:                                               ; preds = %28
  %33 = sub nsw i32 %10, %30
  br label %34

34:                                               ; preds = %34, %32
  %35 = phi i32 [ 1073741824, %32 ], [ %37, %34 ]
  %36 = icmp sgt i32 %35, %33
  %37 = lshr i32 %35, 2
  br i1 %36, label %34, label %38, !llvm.loop !5

38:                                               ; preds = %34
  %39 = icmp eq i32 %35, 0
  br i1 %39, label %53, label %40

40:                                               ; preds = %38, %40
  %41 = phi i32 [ %51, %40 ], [ %35, %38 ]
  %42 = phi i32 [ %50, %40 ], [ 0, %38 ]
  %43 = phi i32 [ %48, %40 ], [ %33, %38 ]
  %44 = add nsw i32 %42, %41
  %45 = icmp slt i32 %43, %44
  %46 = ashr i32 %42, 1
  %47 = select i1 %45, i32 0, i32 %44
  %48 = sub nsw i32 %43, %47
  %49 = select i1 %45, i32 0, i32 %41
  %50 = add nsw i32 %49, %46
  %51 = lshr i32 %41, 2
  %52 = icmp ult i32 %41, 4
  br i1 %52, label %53, label %40, !llvm.loop !7

53:                                               ; preds = %40, %38
  %54 = phi i32 [ 0, %38 ], [ %50, %40 ]
  %55 = add nsw i32 %54, %4
  %56 = mul nuw nsw i32 %26, 1536
  %57 = add nuw nsw i32 %56, %19
  %58 = zext nneg i32 %57 to i64
  %59 = getelementptr inbounds i32, ptr %0, i64 %58
  %60 = load i32, ptr %59, align 4, !tbaa !8
  %61 = icmp slt i32 %60, %55
  br i1 %61, label %62, label %160

62:                                               ; preds = %53
  store i32 %55, ptr %59, align 4, !tbaa !8
  %63 = mul nsw i32 %54, %54
  %64 = add nuw nsw i32 %63, %30
  br label %65

65:                                               ; preds = %65, %62
  %66 = phi i32 [ 1073741824, %62 ], [ %68, %65 ]
  %67 = icmp ugt i32 %66, %64
  %68 = lshr i32 %66, 2
  br i1 %67, label %65, label %69, !llvm.loop !5

69:                                               ; preds = %65
  %70 = icmp eq i32 %66, 0
  br i1 %70, label %92, label %71

71:                                               ; preds = %69, %71
  %72 = phi i32 [ %82, %71 ], [ %66, %69 ]
  %73 = phi i32 [ %81, %71 ], [ 0, %69 ]
  %74 = phi i32 [ %79, %71 ], [ %64, %69 ]
  %75 = add nsw i32 %73, %72
  %76 = icmp slt i32 %74, %75
  %77 = ashr i32 %73, 1
  %78 = select i1 %76, i32 0, i32 %75
  %79 = sub nsw i32 %74, %78
  %80 = select i1 %76, i32 0, i32 %72
  %81 = add nsw i32 %80, %77
  %82 = lshr i32 %72, 2
  %83 = icmp ult i32 %72, 4
  br i1 %83, label %84, label %71, !llvm.loop !7

84:                                               ; preds = %71
  %85 = icmp eq i32 %81, 0
  br i1 %85, label %92, label %86

86:                                               ; preds = %84
  %87 = sdiv i32 %23, %81
  %88 = shl nsw i32 %25, 10
  %89 = sdiv i32 %88, %81
  %90 = shl nsw i32 %54, 10
  %91 = sdiv i32 %90, %81
  br label %92

92:                                               ; preds = %69, %84, %86
  %93 = phi i32 [ %54, %69 ], [ %54, %84 ], [ %91, %86 ]
  %94 = phi i32 [ %18, %69 ], [ %18, %84 ], [ %87, %86 ]
  %95 = phi i32 [ %25, %69 ], [ %25, %84 ], [ %89, %86 ]
  %96 = add i32 %95, %94
  %97 = mul i32 %96, 568
  %98 = mul nsw i32 %93, 796
  %99 = add nsw i32 %97, %98
  %100 = sdiv i32 %99, 1024
  %101 = tail call i32 @llvm.smax.i32(i32 %100, i32 0)
  %102 = mul nsw i32 %94, 292
  %103 = mul nsw i32 %95, 292
  %104 = mul nsw i32 %93, 936
  %105 = add i32 %102, %104
  %106 = add i32 %105, %103
  %107 = sdiv i32 %106, 1024
  %108 = tail call i32 @llvm.smax.i32(i32 %107, i32 0)
  %109 = mul nuw nsw i32 %101, 850
  %110 = mul nsw i32 %108, %108
  %111 = lshr i32 %110, 10
  %112 = mul nsw i32 %111, %108
  %113 = lshr i32 %112, 10
  %114 = mul nsw i32 %113, %108
  %115 = lshr i32 %114, 10
  %116 = mul nsw i32 %115, %108
  %117 = lshr i32 %116, 10
  %118 = mul nsw i32 %117, %108
  %119 = lshr i32 %118, 10
  %120 = mul nsw i32 %119, %108
  %121 = lshr i32 %120, 10
  %122 = mul nsw i32 %121, %108
  %123 = lshr i32 %122, 10
  %124 = mul nsw i32 %123, %108
  %125 = lshr i32 %124, 10
  %126 = mul nsw i32 %125, %108
  %127 = lshr i32 %126, 10
  %128 = mul nsw i32 %127, %108
  %129 = lshr i32 %128, 10
  %130 = mul nsw i32 %129, %108
  %131 = lshr i32 %130, 10
  %132 = mul nsw i32 %131, %108
  %133 = lshr i32 %132, 10
  %134 = mul nsw i32 %133, %108
  %135 = lshr i32 %134, 10
  %136 = mul nsw i32 %135, %108
  %137 = lshr i32 %136, 10
  %138 = mul nsw i32 %137, %108
  %139 = lshr i32 %138, 10
  %140 = lshr i32 %109, 10
  %141 = mul nuw nsw i32 %139, 200
  %142 = lshr i32 %141, 10
  %143 = add nuw nsw i32 %140, 100
  %144 = mul nuw nsw i32 %143, %12
  %145 = lshr i32 %144, 10
  %146 = add nuw nsw i32 %142, %145
  %147 = mul nuw nsw i32 %143, %14
  %148 = lshr i32 %147, 10
  %149 = add nuw nsw i32 %142, %148
  %150 = mul nuw nsw i32 %143, %15
  %151 = lshr i32 %150, 10
  %152 = add nuw nsw i32 %142, %151
  %153 = tail call i32 @llvm.smin.i32(i32 %146, i32 255)
  %154 = tail call i32 @llvm.smin.i32(i32 %149, i32 255)
  %155 = tail call i32 @llvm.smin.i32(i32 %152, i32 255)
  %156 = shl nuw nsw i32 %153, 16
  %157 = shl nuw nsw i32 %154, 8
  %158 = or disjoint i32 %157, %155
  %159 = or disjoint i32 %158, %156
  tail call void @simPutPixel(i32 noundef %19, i32 noundef %26, i32 noundef %159) #8
  br label %160

160:                                              ; preds = %92, %53, %28, %24
  %161 = add i32 %25, 1
  %162 = icmp eq i32 %25, %3
  br i1 %162, label %163, label %24, !llvm.loop !15

163:                                              ; preds = %160, %17
  %164 = add i32 %18, 1
  %165 = icmp eq i32 %18, %3
  br i1 %165, label %16, label %17, !llvm.loop !16
}

; Function Attrs: nounwind uwtable
define dso_local void @spawn(ptr nocapture noundef writeonly %0) local_unnamed_addr #4 {
  %2 = tail call i32 (...) @simRand() #8
  %3 = srem i32 %2, 1504
  %4 = add nsw i32 %3, -752
  store i32 %4, ptr %0, align 4, !tbaa !8
  %5 = tail call i32 (...) @simRand() #8
  %6 = srem i32 %5, 736
  %7 = add nsw i32 %6, -368
  %8 = getelementptr inbounds i32, ptr %0, i64 1
  store i32 %7, ptr %8, align 4, !tbaa !8
  %9 = tail call i32 (...) @simRand() #8
  %10 = srem i32 %9, 600
  %11 = add nsw i32 %10, -300
  %12 = getelementptr inbounds i32, ptr %0, i64 2
  store i32 %11, ptr %12, align 4, !tbaa !8
  %13 = tail call i32 (...) @simRand() #8
  %14 = srem i32 %13, 6
  %15 = getelementptr inbounds i32, ptr %0, i64 3
  store i32 %14, ptr %15, align 4, !tbaa !8
  %16 = tail call i32 (...) @simRand() #8
  %17 = srem i32 %16, 61
  %18 = add nsw i32 %17, 30
  %19 = getelementptr inbounds i32, ptr %0, i64 4
  store i32 %18, ptr %19, align 4, !tbaa !8
  %20 = tail call i32 (...) @simRand() #8
  %21 = srem i32 %20, 14671839
  %22 = add nsw i32 %21, 2105376
  %23 = getelementptr inbounds i32, ptr %0, i64 5
  store i32 %22, ptr %23, align 4, !tbaa !8
  %24 = getelementptr inbounds i32, ptr %0, i64 6
  store i32 1, ptr %24, align 4, !tbaa !8
  ret void
}

; Function Attrs: noreturn nounwind uwtable
define dso_local void @app() local_unnamed_addr #6 {
  %1 = alloca [1179648 x i32], align 16
  %2 = alloca [42 x i32], align 16
  call void @llvm.lifetime.start.p0(i64 4718592, ptr nonnull %1) #8
  call void @llvm.lifetime.start.p0(i64 168, ptr nonnull %2) #8
  br label %3

3:                                                ; preds = %11, %0
  %4 = phi i64 [ 0, %0 ], [ %12, %11 ]
  %5 = mul nuw nsw i64 %4, 1536
  %6 = getelementptr i32, ptr %1, i64 %5
  %7 = trunc i64 %4 to i32
  br label %13

8:                                                ; preds = %13
  %9 = add nuw nsw i64 %4, 1
  %10 = icmp eq i64 %9, 768
  br i1 %10, label %19, label %11

11:                                               ; preds = %140, %8
  %12 = phi i64 [ %9, %8 ], [ 0, %140 ]
  br label %3, !llvm.loop !17

13:                                               ; preds = %13, %3
  %14 = phi i64 [ 0, %3 ], [ %17, %13 ]
  %15 = getelementptr i32, ptr %6, i64 %14
  store i32 -1073741824, ptr %15, align 4, !tbaa !8
  %16 = trunc i64 %14 to i32
  tail call void @simPutPixel(i32 noundef %16, i32 noundef %7, i32 noundef 0) #8
  %17 = add nuw nsw i64 %14, 1
  %18 = icmp eq i64 %17, 1536
  br i1 %18, label %8, label %13, !llvm.loop !13

19:                                               ; preds = %8, %19
  %20 = phi i64 [ %46, %19 ], [ 0, %8 ]
  %21 = mul nuw nsw i64 %20, 7
  %22 = getelementptr inbounds i32, ptr %2, i64 %21
  %23 = tail call i32 (...) @simRand() #8
  %24 = srem i32 %23, 1504
  %25 = add nsw i32 %24, -752
  store i32 %25, ptr %22, align 4, !tbaa !8
  %26 = tail call i32 (...) @simRand() #8
  %27 = srem i32 %26, 736
  %28 = add nsw i32 %27, -368
  %29 = getelementptr inbounds i32, ptr %22, i64 1
  store i32 %28, ptr %29, align 4, !tbaa !8
  %30 = tail call i32 (...) @simRand() #8
  %31 = srem i32 %30, 600
  %32 = add nsw i32 %31, -300
  %33 = getelementptr inbounds i32, ptr %22, i64 2
  store i32 %32, ptr %33, align 4, !tbaa !8
  %34 = tail call i32 (...) @simRand() #8
  %35 = srem i32 %34, 6
  %36 = getelementptr inbounds i32, ptr %22, i64 3
  store i32 %35, ptr %36, align 4, !tbaa !8
  %37 = tail call i32 (...) @simRand() #8
  %38 = srem i32 %37, 61
  %39 = add nsw i32 %38, 30
  %40 = getelementptr inbounds i32, ptr %22, i64 4
  store i32 %39, ptr %40, align 4, !tbaa !8
  %41 = tail call i32 (...) @simRand() #8
  %42 = srem i32 %41, 14671839
  %43 = add nsw i32 %42, 2105376
  %44 = getelementptr inbounds i32, ptr %22, i64 5
  store i32 %43, ptr %44, align 4, !tbaa !8
  %45 = getelementptr inbounds i32, ptr %22, i64 6
  store i32 1, ptr %45, align 4, !tbaa !8
  %46 = add nuw nsw i64 %20, 1
  %47 = icmp eq i64 %46, 6
  br i1 %47, label %50, label %19, !llvm.loop !18

48:                                               ; preds = %133
  tail call void (...) @simFlush() #8
  %49 = icmp eq i32 %134, 0
  br i1 %49, label %140, label %138

50:                                               ; preds = %19, %138
  %51 = phi i64 [ %139, %138 ], [ 0, %19 ]
  %52 = phi i32 [ %135, %138 ], [ 6, %19 ]
  %53 = phi i32 [ %134, %138 ], [ 6, %19 ]
  %54 = mul nuw nsw i64 %51, 7
  %55 = getelementptr inbounds i32, ptr %2, i64 %54
  %56 = getelementptr inbounds i32, ptr %55, i64 6
  %57 = load i32, ptr %56, align 4, !tbaa !8
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %133, label %59

59:                                               ; preds = %50
  %60 = getelementptr inbounds i32, ptr %55, i64 3
  %61 = load i32, ptr %60, align 4, !tbaa !8
  %62 = getelementptr inbounds i32, ptr %55, i64 1
  %63 = insertelement <2 x i32> poison, i32 %61, i64 0
  %64 = shufflevector <2 x i32> %63, <2 x i32> poison, <2 x i32> zeroinitializer
  %65 = icmp eq <2 x i32> %64, <i32 1, i32 3>
  %66 = sext <2 x i1> %65 to <2 x i32>
  %67 = icmp eq <2 x i32> %64, <i32 0, i32 2>
  %68 = shl nsw <2 x i32> %66, <i32 2, i32 2>
  %69 = select <2 x i1> %67, <2 x i32> <i32 4, i32 4>, <2 x i32> %68
  %70 = load <2 x i32>, ptr %55, align 4, !tbaa !8
  %71 = add nsw <2 x i32> %69, %70
  store <2 x i32> %71, ptr %55, align 4, !tbaa !8
  %72 = icmp eq i32 %61, 5
  %73 = sext i1 %72 to i32
  %74 = icmp eq i32 %61, 4
  %75 = shl nsw i32 %73, 2
  %76 = select i1 %74, i32 4, i32 %75
  %77 = getelementptr inbounds i32, ptr %55, i64 2
  %78 = load i32, ptr %77, align 4, !tbaa !8
  %79 = add nsw i32 %78, %76
  store i32 %79, ptr %77, align 4, !tbaa !8
  %80 = add <2 x i32> %71, <i32 752, i32 368>
  %81 = icmp ult <2 x i32> %80, <i32 1505, i32 737>
  %82 = shufflevector <2 x i1> %81, <2 x i1> poison, <2 x i32> <i32 1, i32 poison>
  %83 = and <2 x i1> %81, %82
  %84 = extractelement <2 x i1> %83, i64 0
  %85 = add i32 %79, 300
  %86 = icmp ult i32 %85, 601
  %87 = and i1 %84, %86
  br i1 %87, label %113, label %88

88:                                               ; preds = %59
  %89 = icmp slt i32 %52, 30
  br i1 %89, label %90, label %111

90:                                               ; preds = %88
  %91 = tail call i32 (...) @simRand() #8
  %92 = srem i32 %91, 1504
  %93 = add nsw i32 %92, -752
  store i32 %93, ptr %55, align 4, !tbaa !8
  %94 = tail call i32 (...) @simRand() #8
  %95 = srem i32 %94, 736
  %96 = add nsw i32 %95, -368
  store i32 %96, ptr %62, align 4, !tbaa !8
  %97 = tail call i32 (...) @simRand() #8
  %98 = srem i32 %97, 600
  %99 = add nsw i32 %98, -300
  store i32 %99, ptr %77, align 4, !tbaa !8
  %100 = tail call i32 (...) @simRand() #8
  %101 = srem i32 %100, 6
  store i32 %101, ptr %60, align 4, !tbaa !8
  %102 = tail call i32 (...) @simRand() #8
  %103 = srem i32 %102, 61
  %104 = add nsw i32 %103, 30
  %105 = getelementptr inbounds i32, ptr %55, i64 4
  store i32 %104, ptr %105, align 4, !tbaa !8
  %106 = tail call i32 (...) @simRand() #8
  %107 = srem i32 %106, 14671839
  %108 = add nsw i32 %107, 2105376
  %109 = getelementptr inbounds i32, ptr %55, i64 5
  store i32 %108, ptr %109, align 4, !tbaa !8
  store i32 1, ptr %56, align 4, !tbaa !8
  %110 = add nsw i32 %52, 1
  br label %133

111:                                              ; preds = %88
  store i32 0, ptr %56, align 4, !tbaa !8
  %112 = add nsw i32 %53, -1
  br label %133

113:                                              ; preds = %59
  %114 = extractelement <2 x i32> %71, i64 0
  %115 = add nsw i32 %114, 768
  %116 = extractelement <2 x i32> %71, i64 1
  %117 = add nsw i32 %116, 384
  %118 = getelementptr inbounds i32, ptr %55, i64 5
  %119 = load i32, ptr %118, align 4, !tbaa !8
  call void @drawSphere(ptr noundef nonnull %1, i32 noundef %115, i32 noundef %117, i32 noundef 12, i32 noundef %79, i32 noundef %119)
  %120 = getelementptr inbounds i32, ptr %55, i64 4
  %121 = load i32, ptr %120, align 4, !tbaa !8
  %122 = add nsw i32 %121, -4
  store i32 %122, ptr %120, align 4, !tbaa !8
  %123 = icmp slt i32 %121, 5
  br i1 %123, label %124, label %133

124:                                              ; preds = %113, %124
  %125 = tail call i32 (...) @simRand() #8
  %126 = srem i32 %125, 6
  %127 = xor i32 %126, %61
  %128 = icmp eq i32 %127, 1
  br i1 %128, label %124, label %129, !llvm.loop !14

129:                                              ; preds = %124
  store i32 %126, ptr %60, align 4, !tbaa !8
  call void @drawSphere(ptr noundef nonnull %1, i32 noundef %115, i32 noundef %117, i32 noundef 16, i32 noundef %79, i32 noundef %119)
  %130 = tail call i32 (...) @simRand() #8
  %131 = srem i32 %130, 61
  %132 = add nsw i32 %131, 30
  store i32 %132, ptr %120, align 4, !tbaa !8
  br label %133

133:                                              ; preds = %113, %129, %90, %111, %50
  %134 = phi i32 [ %53, %50 ], [ %53, %90 ], [ %112, %111 ], [ %53, %129 ], [ %53, %113 ]
  %135 = phi i32 [ %52, %50 ], [ %110, %90 ], [ %52, %111 ], [ %52, %129 ], [ %52, %113 ]
  %136 = add nuw nsw i64 %51, 1
  %137 = icmp eq i64 %136, 6
  br i1 %137, label %48, label %138

138:                                              ; preds = %133, %48
  %139 = phi i64 [ %136, %133 ], [ 0, %48 ]
  br label %50, !llvm.loop !19

140:                                              ; preds = %48, %140
  %141 = phi i32 [ %142, %140 ], [ 0, %48 ]
  tail call void (...) @simFlush() #8
  %142 = add nuw nsw i32 %141, 1
  %143 = icmp eq i32 %142, 300
  br i1 %143, label %11, label %140, !llvm.loop !17
}

declare void @simFlush(...) local_unnamed_addr #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #7

attributes #0 = { nofree norecurse nosync nounwind memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = distinct !{!12, !6}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
!18 = distinct !{!18, !6}
!19 = distinct !{!19, !6}
