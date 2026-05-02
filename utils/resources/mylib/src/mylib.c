#include "mylib.h"
#include <stdlib.h>
#include <string.h>
#include <math.h>

/* MyStruct */

MyStruct CreateMyStruct(int x, float y) {
    MyStruct r; r.intField = x; r.floatField = y; return r;
}
MyStruct ComputeMyStruct() {
    MyStruct r; r.intField = 42; r.floatField = 3.14f; return r;
}
void MutateMyStruct(MyStruct *s) {
    if (!s) return;
    s->intField   += 10;
    if (s->floatField == 0) s->floatField = 1;
    s->floatField *= 2.0f;
}

/* Enums */

MyStatus GetStatus() { return STATUS_OK; }

int IsStatusOk(MyStatus status) { return status == STATUS_OK ? 1 : 0; }

MyColor InvertColor(MyColor color) {
    switch (color) {
        case COLOR_RED:   return COLOR_BLUE;
        case COLOR_GREEN: return COLOR_GREEN;
        case COLOR_BLUE:  return COLOR_RED;
        default:          return COLOR_RED;
    }
}

/* Numeric primitives */

int AddInts(int a, int b) { return a + b; }
float AddFloats(float a, float b) { return a + b; }
double AddDoubles(double a, double b) { return a + b; }
int64_t AddInt64s(int64_t a, int64_t b) { return a + b; }
uint32_t BitwiseAnd(uint32_t a, uint32_t b) { return a & b; }

/* Bool-like */

int AndBools(int a, int b) { return (a && b) ? 1 : 0; }
int NotBool(int a) { return a ? 0 : 1; }

/* Pointer parameters */

void GetVec3(MyVec3 *out) {
    if (!out) return;
    out->x = 1.0f; out->y = 2.0f; out->z = 3.0f;
}

void NormalizeVec3(MyVec3 *v) {
    if (!v) return;
    float len = sqrtf(v->x*v->x + v->y*v->y + v->z*v->z);
    if (len == 0.0f) return;
    v->x /= len; v->y /= len; v->z /= len;
}

void MinMax(float *values, int count, float *outMin, float *outMax) {
    if (!values || count <= 0 || !outMin || !outMax) return;
    *outMin = *outMax = values[0];
    for (int i = 1; i < count; i++) {
        if (values[i] < *outMin) *outMin = values[i];
        if (values[i] > *outMax) *outMax = values[i];
    }
}

int TryReadInt(int *maybeNull) {
    return maybeNull ? *maybeNull : -1;
}

void AllocateNode(MyNode **outNode, int value) {
    if (!outNode) return;
    MyNode *n  = (MyNode *)malloc(sizeof(MyNode));
    n->value = value;
    n->next  = NULL;
    *outNode = n;
}

/* Pointer return values */

MyVec3 *GetGlobalOrigin() {
    static MyVec3 origin = {0.0f, 0.0f, 0.0f};
    return &origin;
}

MyNode *CreateNode(int value) {
    MyNode *n  = (MyNode *)malloc(sizeof(MyNode));
    n->value = value;
    n->next  = NULL;
    return n;
}

MyNode *FindNode(MyNode *head, int value) {
    while (head) {
        if (head->value == value) return head;
        head = head->next;
    }
    return NULL; /* returns NULL if not found */
}

/* Arrays via pointer + length */

float SumFloats(float *values, int count) {
    float sum = 0.0f;
    for (int i = 0; i < count; i++) sum += values[i];
    return sum;
}

int FillRange(int *outBuffer, int count, int start) {
    if (!outBuffer || count <= 0) return 0;
    for (int i = 0; i < count; i++) outBuffer[i] = start + i;
    return count;
}

/* Struct with embedded pointer */

MyImage CreateImage(int width, int height, int channels) {
    MyImage img;
    img.width    = width;
    img.height   = height;
    img.channels = channels;
    img.pixels   = (uint8_t *)calloc(width * height * channels, 1);
    return img;
}

void FillImage(MyImage *image, uint8_t value) {
    if (!image || !image->pixels) return;
    memset(image->pixels, value, image->width * image->height * image->channels);
}

void FreeImage(MyImage *image) {
    if (!image) return;
    free(image->pixels);
    image->pixels = NULL;
}

/* Nested structs */

MyRigidBody CreateRigidBody(MyVec3 position, MyVec3 velocity, float mass) {
    MyRigidBody b;
    b.position = position;
    b.velocity = velocity;
    b.mass     = mass;
    return b;
}

void StepRigidBody(MyRigidBody *body, float dt) {
    if (!body) return;
    body->position.x += body->velocity.x * dt;
    body->position.y += body->velocity.y * dt;
    body->position.z += body->velocity.z * dt;
}

MyVec3 GetRigidBodyPosition(MyRigidBody body) {
    return body.position;
}

/* FloatArray */

MyFloatArray MakeFloatArray(int count) {
    MyFloatArray a;
    a.count  = count;
    a.values = (float *)calloc(count, sizeof(float));
    return a;
}

void FreeFloatArray(MyFloatArray *arr) {
    if (!arr) return;
    free(arr->values);
    arr->values = NULL;
    arr->count  = 0;
}

float FloatArraySum(MyFloatArray arr) {
    float sum = 0.0f;
    for (int i = 0; i < arr.count; i++) sum += arr.values[i];
    return sum;
}

/* Linked list */

MyNode *BuildList(int *values, int count) {
    if (!values || count <= 0) return NULL;
    MyNode *head = CreateNode(values[0]);
    MyNode *cur  = head;
    for (int i = 1; i < count; i++) {
        cur->next = CreateNode(values[i]);
        cur = cur->next;
    }
    return head;
}

void FreeList(MyNode *head) {
    while (head) {
        MyNode *next = head->next;
        free(head);
        head = next;
    }
}

int ListLength(MyNode *head) {
    int n = 0;
    while (head) { n++; head = head->next; }
    return n;
}

void AppendNode(MyNode *head, int value) {
    if (!head) return;
    while (head->next) head = head->next;
    head->next = CreateNode(value);
}

/* Result struct */

MyResult MakeResult(MyStatus status, int code, const char *message) {
    MyResult r;
    r.status = status;
    r.code   = code;
    strncpy(r.message, message ? message : "", 127);
    r.message[127] = '\0';
    return r;
}

int ResultIsOk(MyResult result) {
    return result.status == STATUS_OK ? 1 : 0;
}

/* Opaque handle */

typedef struct { int secret; } MyHandleImpl;

void *CreateHandle() {
    MyHandleImpl *h = (MyHandleImpl *)malloc(sizeof(MyHandleImpl));
    h->secret = 1234;
    return (void *)h;
}

void UseHandle(void *handle, int param) {
    if (!handle) return;
    ((MyHandleImpl *)handle)->secret += param;
}

void DestroyHandle(void *handle) {
    free(handle);
}

/* Double pointer (array of pointers) */

MyNode **CreateNodeArray(int *values, int count) {
    MyNode **arr = (MyNode **)malloc(count * sizeof(MyNode *));
    for (int i = 0; i < count; i++) arr[i] = CreateNode(values[i]);
    return arr;
}

void FreeNodeArray(MyNode **array, int count) {
    if (!array) return;
    for (int i = 0; i < count; i++) free(array[i]);
    free(array);
}

/* Conditional out-param */

int TryComputeVec3(int condition, MyVec3 *out) {
    if (!condition || !out) return 0;
    out->x = 9.0f; out->y = 8.0f; out->z = 7.0f;
    return 1;
}

/* Vec3 math (by value / by pointer combos) */

float Vec3Dot(MyVec3 a, MyVec3 b) {
    return a.x*b.x + a.y*b.y + a.z*b.z;
}

MyVec3 Vec3Cross(MyVec3 a, MyVec3 b) {
    MyVec3 r;
    r.x = a.y*b.z - a.z*b.y;
    r.y = a.z*b.x - a.x*b.z;
    r.z = a.x*b.y - a.y*b.x;
    return r;
}

MyVec3 Vec3Add(MyVec3 *a, MyVec3 *b) {
    MyVec3 r;
    if (!a || !b) { r.x = r.y = r.z = 0.0f; return r; }
    r.x = a->x + b->x;
    r.y = a->y + b->y;
    r.z = a->z + b->z;
    return r;
}