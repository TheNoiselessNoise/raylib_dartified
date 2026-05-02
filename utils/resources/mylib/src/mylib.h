#ifndef MYLIB_H
#define MYLIB_H

#include <stdint.h>

/* Enums */

typedef enum {
    STATUS_OK       = 0,
    STATUS_ERROR    = 1,
    STATUS_PENDING  = 2,
    STATUS_TIMEOUT  = 3
} MyStatus;

typedef enum {
    COLOR_RED   = 0,
    COLOR_GREEN = 1,
    COLOR_BLUE  = 2
} MyColor;

/* Structs */

typedef struct {
    int intField;
    float floatField;
} MyStruct;

typedef struct {
    float x;
    float y;
    float z;
} MyVec3;

typedef struct {
    MyVec3 position; /* nested struct by value */
    MyVec3 velocity;
    float mass;
} MyRigidBody;

typedef struct {
    int width;
    int height;
    int channels;
    uint8_t *pixels; /* pointer to heap data owned by caller */
} MyImage;

typedef struct {
    int count;
    float *values; /* pointer to array of floats */
} MyFloatArray;

typedef struct {
    MyStatus status; /* enum field */
    int code;
    char message[128]; /* fixed-size char array inside struct */
} MyResult;

typedef struct MyNode MyNode;
struct MyNode {
    int value;
    MyNode *next; /* self-referential / linked list node */
};

/* MyStruct */

MyStruct CreateMyStruct(int x, float y);
MyStruct ComputeMyStruct();
void MutateMyStruct(MyStruct *s);

/* Enums */

/* Return an enum */
MyStatus GetStatus();

/* Accept an enum */
int IsStatusOk(MyStatus status);

/* Accept and return an enum */
MyColor InvertColor(MyColor color);

/* Numeric primitives */

int AddInts(int a, int b);
float AddFloats(float a, float b);
double AddDoubles(double a, double b);
int64_t AddInt64s(int64_t a, int64_t b);
uint32_t BitwiseAnd(uint32_t a, uint32_t b);

/* Bool-like (C has no bool, int used as 0/1) */

int AndBools(int a, int b);
int NotBool(int a);

/* Pointer parameters */

/* Out-parameter: caller allocates, callee writes */
void GetVec3(MyVec3 *out);

/* In/out: callee reads and mutates */
void NormalizeVec3(MyVec3 *v);

/* Two out-parameters */
void MinMax(float *values, int count, float *outMin, float *outMax);

/* Nullable pointer: callee must null-check */
int TryReadInt(int *maybeNull);

/* Pointer to pointer (out-parameter of pointer type) */
void AllocateNode(MyNode **outNode, int value);

/* Pointer return values */

/* Returns pointer to static/global, do NOT free */
MyVec3 *GetGlobalOrigin();

/* Returns heap-allocated, caller must free */
MyNode *CreateNode(int value);

/* Returns NULL on failure */
MyNode *FindNode(MyNode *head, int value);

/* Arrays via pointer + length */

/* Caller passes array + length, callee reads */
float SumFloats(float *values, int count);

/* Callee fills caller-provided buffer, returns how many written */
int FillRange(int *outBuffer, int count, int start);

/* Struct with embedded pointer (heap data) */

MyImage CreateImage(int width, int height, int channels);
void FillImage(MyImage *image, uint8_t value);
void FreeImage(MyImage *image);

/* Nested structs */

MyRigidBody CreateRigidBody(MyVec3 position, MyVec3 velocity, float mass);
void StepRigidBody(MyRigidBody *body, float dt);
MyVec3 GetRigidBodyPosition(MyRigidBody body); /* pass struct by value */

/* Struct with pointer array field */

MyFloatArray MakeFloatArray(int count);
void FreeFloatArray(MyFloatArray *arr);
float FloatArraySum(MyFloatArray arr); /* pass by value */

/* Linked list / self-referential */

MyNode *BuildList(int *values, int count);
void FreeList(MyNode *head);
int ListLength(MyNode *head);
void AppendNode(MyNode *head, int value);

/* Struct return with enum field */

MyResult MakeResult(MyStatus status, int code, const char *message);
int ResultIsOk(MyResult result); /* pass by value */

/* Void pointer (opaque handle pattern) */

void *CreateHandle();
void UseHandle(void *handle, int param);
void DestroyHandle(void *handle);

/* Double pointer (array of pointers) */

MyNode **CreateNodeArray(int *values, int count);
void FreeNodeArray(MyNode **array, int count);

/* Pointer to struct returned via out-param */

int TryComputeVec3(int condition, MyVec3 *out);

/* Function accepts struct by value vs by pointer */

float Vec3Dot(MyVec3 a, MyVec3 b); /* two structs by value */
MyVec3 Vec3Cross(MyVec3 a, MyVec3 b); /* struct return + two by value */
MyVec3 Vec3Add(MyVec3 *a, MyVec3 *b); /* two structs by pointer */

#endif