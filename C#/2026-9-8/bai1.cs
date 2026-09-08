using System.Text;

Console.InputEncoding = Encoding.UTF8;
Console.OutputEncoding = Encoding.UTF8;
Console.Write("Nhập vào số nguyên a: ");
int a = Convert.ToInt16(Console.ReadLine());
if (a % 2 == 0)
{
	Console.WriteLine("a là số chẵn.");
}
else
{
	Console.WriteLine("a là số lẻ.");
}