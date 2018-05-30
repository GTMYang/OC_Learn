//
//  Structs.h
//  OC研究
//
//  Created by 骆扬 on 2018/5/23.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#pragma mark - Modes

struct __CFRunLoopMode {
//    CFRuntimeBase _base;
//    pthread_mutex_t _lock;    /* must have the run loop locked before locking this */
    CFStringRef _name;
//    Boolean _stopped;
//    char _padding[3];
    CFMutableSetRef _sources0;  // Set
    CFMutableSetRef _sources1;  // Set
    CFMutableArrayRef _observers;  // Array
    CFMutableArrayRef _timers;      // Array
    CFMutableDictionaryRef _portToV1SourceMap;  // port -> source
    __CFPortSet _portSet;
//    CFIndex _observerMask;
//#if USE_DISPATCH_SOURCE_FOR_TIMERS
//    dispatch_source_t _timerSource;
//    dispatch_queue_t _queue;
//    Boolean _timerFired; // set to true by the source when a timer has fired
//    Boolean _dispatchTimerArmed;
//#endif
//#if USE_MK_TIMER_TOO
//    mach_port_t _timerPort;
//    Boolean _mkTimerArmed;
//#endif
//#if DEPLOYMENT_TARGET_WINDOWS
//    DWORD _msgQMask;
//    void (*_msgPump)(void);
//#endif
//    uint64_t _timerSoftDeadline; /* TSR */
//    uint64_t _timerHardDeadline; /* TSR */
};

#pragma mark - Run Loops

struct __CFRunLoop {
//    CFRuntimeBase _base;
//    pthread_mutex_t _lock;            /* locked for accessing mode list */
//    __CFPort _wakeUpPort;            // used for CFRunLoopWakeUp
//    Boolean _unused;
//    volatile _per_run_data *_perRunData;              // reset for runs of the run loop
//    pthread_t _pthread;
//    uint32_t _winthread;
    CFMutableSetRef _commonModes;       // names Set
    CFMutableSetRef _commonModeItems;   // model items Set
    CFRunLoopModeRef _currentMode;      //
    CFMutableSetRef _modes;             // models Set
    struct _block_item *_blocks_head;
    struct _block_item *_blocks_tail;
//    CFTypeRef _counterpart;
};

struct _block_item {
    struct _block_item *_next;
    CFTypeRef _mode;    // CFString or CFSet  (model names)
    void (^_block)(void);
};

#pragma mark - Sources

struct __CFRunLoopSource {
//    CFRuntimeBase _base;
//    uint32_t _bits;
//    pthread_mutex_t _lock;
    CFIndex _order;            /* immutable */
    CFMutableBagRef _runLoops;
    union {
        CFRunLoopSourceContext version0;    /* immutable, except invalidation */
        CFRunLoopSourceContext1 version1;    /* immutable, except invalidation */
    } _context;
};

#pragma mark Sources Version0
typedef struct {
    CFIndex    version;
    void *    info;
    const void *(*retain)(const void *info);
    void    (*release)(const void *info);
    CFStringRef    (*copyDescription)(const void *info);
    Boolean    (*equal)(const void *info1, const void *info2);
    CFHashCode    (*hash)(const void *info);
    void    (*schedule)(void *info, CFRunLoopRef rl, CFRunLoopMode mode);
    void    (*cancel)(void *info, CFRunLoopRef rl, CFRunLoopMode mode);
    void    (*perform)(void *info);
} CFRunLoopSourceContext;

#pragma mark Sources Version1
typedef struct {
    CFIndex    version;
    void *    info;
    const void *(*retain)(const void *info);
    void    (*release)(const void *info);
    CFStringRef    (*copyDescription)(const void *info);
    Boolean    (*equal)(const void *info1, const void *info2);
    CFHashCode    (*hash)(const void *info);
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)) || (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
    mach_port_t    (*getPort)(void *info);
    void *    (*perform)(void *msg, CFIndex size, CFAllocatorRef allocator, void *info);
#else
    void *    (*getPort)(void *info);
    void    (*perform)(void *info);
#endif
} CFRunLoopSourceContext1;

#pragma mark - Observers

struct __CFRunLoopObserver {
//    CFRuntimeBase _base;
//    pthread_mutex_t _lock;
    CFRunLoopRef _runLoop;
    CFIndex _rlCount;
    CFOptionFlags _activities;        /* immutable */
    CFIndex _order;            /* immutable */
    CFRunLoopObserverCallBack _callout;    /* immutable */
    CFRunLoopObserverContext _context;    /* immutable, except invalidation */
};

typedef struct {
    CFIndex    version;
    void *    info;
    const void *(*retain)(const void *info);
    void    (*release)(const void *info);
    CFStringRef    (*copyDescription)(const void *info);
} CFRunLoopObserverContext;

#pragma mark - Timers

struct __CFRunLoopTimer {
//    CFRuntimeBase _base;
//    uint16_t _bits;
//    pthread_mutex_t _lock;
    CFRunLoopRef _runLoop;
    CFMutableSetRef _rlModes;
    CFAbsoluteTime _nextFireDate;
    CFTimeInterval _interval;        /* immutable */
    CFTimeInterval _tolerance;          /* mutable */
    uint64_t _fireTSR;            /* TSR units */
    CFIndex _order;            /* immutable */
    CFRunLoopTimerCallBack _callout;    /* immutable */
    CFRunLoopTimerContext _context;    /* immutable, except invalidation */
};






