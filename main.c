#include <stdint.h>
#define NS 5
extern long print(const char *msg,...);
extern long  get_valid_int(long edge1, long edge2);
extern long var4();

int64_t arr[NS];
int64_t A = 0;
int64_t B = 0;
int64_t RESULT = 0;
int N = NS;
void show_arr(int64_t *arr)
{
    for(int i = 0;i<N;i++)
    {
        print("%d ",arr[i]);
    }
    print("\n");
}

int main()
{
    
    print("Введите элементы массива:\n");
    for(int i = 0;i<N;i++)
    {
        print("%d - ",i);
        arr[i]=get_valid_int(-32768,32767);
    }
    print("Введите A: ");
    A = get_valid_int(0,32767);
    
    print("Введите B: ");
    B = get_valid_int(0,32767);
    show_arr(arr);
    var4();
    print("количество элементов, удовлетворяющие условию [%d<=a[i]<=%d]: %d\n", A,B,RESULT);
    return 0;
}