import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  print('''
    HESAP MAKİNESİ
    1- Toplama
    2- Çıkarma
    3- Çarpma
    4- Bölme''');
  HesapMakinasi.calistir();
}

class HesapMakinasi {

  var a;
  var b;

  HesapMakinasi(var x, var y) {
    this.a = x;
    this.b = y;
  }

  double toplama(double x, double y) {
    return x + y;
  }

  double cikarma(double x, double y) {
    return x - y;
  }

  double carpma(double x, double y) {
    return x * y;
  }

  double bolme(double x, double y) {
    return x / y;
  }

  static void backToMenu() {
    print("\nYeni bir işlem başlatılıyor...\n");
    calistir();
  }

  static void calistir() {
      print(r"('0' yazılması durumunda çıkış yapılacaktır.)");
      print("İlk sayıyı giriniz: ");
      var girdi1 = stdin.readLineSync();
      if (girdi1 != null) {
        double.parse(girdi1);
      }

      if (double.parse(girdi1) == 0) {
        print("Hesap makinesinden çıkılıyor.");
        exit(0);
      }

      print("İkinci sayıyı giriniz: ");
      var girdi2 = stdin.readLineSync();
      if (girdi2 != null) {
          double.parse(girdi2);
      }

      print("Islem seciniz: ");
      var operation = stdin.readLineSync();
      double ilk_sayi = double.parse(girdi1);
      double ikinci_sayi = double.parse(girdi2);

      HesapMakinasi calc = new HesapMakinasi(ilk_sayi, ikinci_sayi);

      switch (operation) {
          case "+":
            print(
                "${calc.a} + ${calc.b} = ${calc.toplama(ilk_sayi, ikinci_sayi)}");
            backToMenu();
            break;
          case "-":
            print(
                "${calc.a} - ${calc.b} = ${calc.cikarma(ilk_sayi, ikinci_sayi)}");
            backToMenu();
            break;
          case "*":
            print(
                "${calc.a} * ${calc.b} = ${calc.carpma(ilk_sayi, ikinci_sayi)}");
            backToMenu();
            break;
          case "/":
            if (ikinci_sayi == 0) {
              print("Herhangi bir sayı '0'a bölünmez.");
              backToMenu();
            } else {
              print(
                  "${calc.a} / ${calc.b} = ${calc.bolme(ilk_sayi, ikinci_sayi)}");
              backToMenu();
            }
            break;
          default:
            backToMenu();
            break;
        }
      }
    }
  }
}