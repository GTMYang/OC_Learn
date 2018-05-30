

// @implementation TestBlock

struct __Block_byref_obj_0 {
  void *__isa;
__Block_byref_obj_0 *__forwarding;
 int __flags;
 int __size;
 void (*__Block_byref_id_object_copy)(void*, void*);
 void (*__Block_byref_id_object_dispose)(void*);
 OBJ *obj;
};
struct __Block_byref_cc_1 {
  void *__isa;
__Block_byref_cc_1 *__forwarding;
 int __flags;
 int __size;
 int cc;
};

struct __TestBlock__initBlock_block_impl_0 {
  struct __block_impl impl;
  struct __TestBlock__initBlock_block_desc_0* Desc;
  NSString *bb;
  int dd;
  __Block_byref_obj_0 *obj; // by ref
  __Block_byref_cc_1 *cc; // by ref
  __TestBlock__initBlock_block_impl_0(void *fp, struct __TestBlock__initBlock_block_desc_0 *desc, NSString *_bb, int _dd, __Block_byref_obj_0 *_obj, __Block_byref_cc_1 *_cc, int flags=0) : bb(_bb), dd(_dd), obj(_obj->__forwarding), cc(_cc->__forwarding) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};
static void __TestBlock__initBlock_block_func_0(struct __TestBlock__initBlock_block_impl_0 *__cself, NSString *bbs) {
  __Block_byref_obj_0 *obj = __cself->obj; // bound by ref
  __Block_byref_cc_1 *cc = __cself->cc; // bound by ref
  NSString *bb = __cself->bb; // bound by copy
  int dd = __cself->dd; // bound by copy


        NSLog((NSString *)&__NSConstantStringImpl__var_folders_kb_hrh7kmq16p729gwbvk_9qfv80000gn_T_TestBlock_b3f3b0_mi_1, bb, (obj->__forwarding->obj), dd);
        (cc->__forwarding->cc) = 55;
    }
static void __TestBlock__initBlock_block_copy_0(struct __TestBlock__initBlock_block_impl_0*dst, struct __TestBlock__initBlock_block_impl_0*src) {_Block_object_assign((void*)&dst->bb, (void*)src->bb, 3/*BLOCK_FIELD_IS_OBJECT*/);_Block_object_assign((void*)&dst->obj, (void*)src->obj, 8/*BLOCK_FIELD_IS_BYREF*/);_Block_object_assign((void*)&dst->cc, (void*)src->cc, 8/*BLOCK_FIELD_IS_BYREF*/);}

static void __TestBlock__initBlock_block_dispose_0(struct __TestBlock__initBlock_block_impl_0*src) {_Block_object_dispose((void*)src->bb, 3/*BLOCK_FIELD_IS_OBJECT*/);_Block_object_dispose((void*)src->obj, 8/*BLOCK_FIELD_IS_BYREF*/);_Block_object_dispose((void*)src->cc, 8/*BLOCK_FIELD_IS_BYREF*/);}

static struct __TestBlock__initBlock_block_desc_0 {
  size_t reserved;
  size_t Block_size;
  void (*copy)(struct __TestBlock__initBlock_block_impl_0*, struct __TestBlock__initBlock_block_impl_0*);
  void (*dispose)(struct __TestBlock__initBlock_block_impl_0*);
} __TestBlock__initBlock_block_desc_0_DATA = { 0, sizeof(struct __TestBlock__initBlock_block_impl_0), __TestBlock__initBlock_block_copy_0, __TestBlock__initBlock_block_dispose_0};

static void _I_TestBlock_initBlock(TestBlock * self, SEL _cmd) {
    __attribute__((__blocks__(byref))) __Block_byref_obj_0 obj = {(void*)0,(__Block_byref_obj_0 *)&obj, 33554432, sizeof(__Block_byref_obj_0), __Block_byref_id_object_copy_131, __Block_byref_id_object_dispose_131, ((OBJ *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("OBJ"), sel_registerName("new"))};
    NSString *bb = (NSString *)&__NSConstantStringImpl__var_folders_kb_hrh7kmq16p729gwbvk_9qfv80000gn_T_TestBlock_b3f3b0_mi_0;
    __attribute__((__blocks__(byref))) __Block_byref_cc_1 cc = {(void*)0,(__Block_byref_cc_1 *)&cc, 0, sizeof(__Block_byref_cc_1), 33};
    int dd = 55;
    void(*temp)(NSString *bb) = ((void (*)(NSString *))&__TestBlock__initBlock_block_impl_0((void *)__TestBlock__initBlock_block_func_0, &__TestBlock__initBlock_block_desc_0_DATA, bb, dd, (__Block_byref_obj_0 *)&obj, (__Block_byref_cc_1 *)&cc, 570425344));
    (*(void (**)(NSString *))((char *)self + OBJC_IVAR_$_TestBlock$_block)) = temp;
}




