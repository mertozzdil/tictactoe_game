List<GameButton> buttonList(): Oluşturulan butonlar burada tutulur.

List player1/player2(): Kimin kazandığı buton id'lerine göre belirlenmektedir. Bu sebepten her
tıklananbutonun id'si oyuncu sırasına görebu listelere aktarılmaktadır.

List doInit(): Tüm butonlar burada oluşturulur ve bir <GameButton> listesi döndürür. Bu dönen ise
initState içerisinde buttonList'e aktarılır.

playGame(): her butona tıklandığında setState içerisinde tıklanan butonun Text'ini ve Color'unu
değiştirir. activePlayer de burada düzenlenir. Ayrıca checkWinner fonksiyonu setState içerisinde
olduğu için her tıklandığında player1 ve player2 listeleri sorgulanır.

checkWinner(): Butonlara her tıklandığında player1 ve player2 listeleri içerdikleri buton id'lerine
göre sorgulanır. Ve bu sonuca göre bir AlertDialog gösterilir. Bu AlertDialog, CustomDialog()
class'ından sağlanır. Ayrıca bu method içerisinde => activePlayer==2 ? autoPlay() : null kodu da
mevcuttur. Bu da autoPlay() metodunu çalıştırır.

autoPlay(): Henüz tıklanmamış butonların tespiti için emptyCells() isimli bir liste oluşturulmuştur.
Öncelikle player1 ve player2 listelerinin içermediği id'li buton id'lerini emptyCells listesine
ekler. Ardından random sayı üretilerek baştaki butonlardan rastgele biri oyuna dahil edilir.

void resetGame(): Yalnızca doInit() fonksiyonunu çalıştırdığı için oyunu sıfırlar.
