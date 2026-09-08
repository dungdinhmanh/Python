using System.Text;
// Change encoding
Console.InputEncoding = Encoding.UTF8;
Console.OutputEncoding = Encoding.UTF8;

Console.WriteLine("Xin chào các bạn");
int a,b;
Console.Write("Nhập giá trị a: ");
a = Convert.ToInt32(Console.ReadLine());
Console.Write("Nhập giá trị b: ");
b = Convert.ToInt32(Console.ReadLine());
Console.WriteLine($"Tổng {a} và {b} là {a+b}");
Console.WriteLine("Hiệu 2 số là: "+ (a-b));
Console.WriteLine("Tích 2 số là: ", a*b);
Console.WriteLine("Thương 2 số là:" + a/b);