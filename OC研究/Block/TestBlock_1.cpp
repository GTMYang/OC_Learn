
// @implementation TestBlock

struct __Block_byref_cc_0 {
  void *__isa;
__Block_byref_cc_0 *__forwarding;
 int __flags;
 int __size;
 int cc;
};

struct __TestBlock__initBlock_block_impl_0 {
  struct __block_impl impl;
  struct __TestBlock__initBlock_block_desc_0* Desc;
  NSString *bb;
  __Block_byref_cc_0 *cc; // by ref
  __TestBlock__initBlock_block_impl_0(void *fp, struct __TestBlock__initBlock_block_desc_0 *desc, NSString *_bb, __Block_byref_cc_0 *_cc, int flags=0) : bb(_bb), cc(_cc->__forwarding) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};



static void __TestBlock__initBlock_block_func_0(struct __TestBlock__initBlock_block_impl_0 *__cself, NSString *bbs) {
  __Block_byref_cc_0 *cc = __cself->cc; // bound by ref
  NSString *bb = __cself->bb; // bound by copy

        NSLog((NSString *)&__NSConstantStringImpl__var_folders_kb_hrh7kmq16p729gwbvk_9qfv80000gn_T_TestBlock_95f057_mi_1, bb, bbs);
        (cc->__forwarding->cc) = 55;
    }
static void __TestBlock__initBlock_block_copy_0(struct __TestBlock__initBlock_block_impl_0*dst, struct __TestBlock__initBlock_block_impl_0*src) {_Block_object_assign((void*)&dst->bb, (void*)src->bb, 3/*BLOCK_FIELD_IS_OBJECT*/);
    _Block_object_assign((void*)&dst->cc, (void*)src->cc, 8/*BLOCK_FIELD_IS_BYREF*/);}

static void __TestBlock__initBlock_block_dispose_0(struct __TestBlock__initBlock_block_impl_0*src) {_Block_object_dispose((void*)src->bb, 3/*BLOCK_FIELD_IS_OBJECT*/);_Block_object_dispose((void*)src->cc, 8/*BLOCK_FIELD_IS_BYREF*/);}

static struct __TestBlock__initBlock_block_desc_0 {
  size_t reserved;
  size_t Block_size;
  void (*copy)(struct __TestBlock__initBlock_block_impl_0*, struct __TestBlock__initBlock_block_impl_0*);
  void (*dispose)(struct __TestBlock__initBlock_block_impl_0*);
} __TestBlock__initBlock_block_desc_0_DATA = { 0, sizeof(struct __TestBlock__initBlock_block_impl_0), __TestBlock__initBlock_block_copy_0, __TestBlock__initBlock_block_dispose_0};


#pragma mark - Method

static void _I_TestBlock_initBlock(TestBlock * self, SEL _cmd) {
    NSString *bb = (NSString *)&__NSConstantStringImpl__var_folders_kb_hrh7kmq16p729gwbvk_9qfv80000gn_T_TestBlock_95f057_mi_0;
    
    __attribute__((__blocks__(byref))) __Block_byref_cc_0 cc = {(void*)0,(__Block_byref_cc_0 *)&cc, 0, sizeof(__Block_byref_cc_0), 33};
    
    (*(void (**)(NSString *))((char *)self + OBJC_IVAR_$_TestBlock$_block1)) = (void (*)(NSString *))
    (
     (id (*)(id, SEL))(void *)objc_msgSend)
    (
     (id)
     (
      (void (*)(NSString *))&__TestBlock__initBlock_block_impl_0((void *)__TestBlock__initBlock_block_func_0, &__TestBlock__initBlock_block_desc_0_DATA, bb, (__Block_byref_cc_0 *)&cc, 570425344)),
     sel_registerName("copy")
     );

}
// @end
