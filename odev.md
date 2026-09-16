### GÖREV 1: Mobil Akış Şeması (Flowchart) veya Sözde Kod (25 Puan)
- `Başla – if auth değilse login e git – ürün seçip sepete ekle- if stok yetersizse uyarı dön – if stok yeterliyse sepete ekle – sepetteki ürünleri dön fiyatıyla çarp – if sepet onaylanırsa bakiye yeterli mi – if yetersizse hata döndür – if yeterliyse sipariş oluştur ve bakiyeden düş.`

### GÖREV 2: REST API Uç Noktası (Endpoint) & JSON Tasarımı (25 Puan)
* Sipariş Oluşturma Endpoint'i:
`
    curl -X POST baseURL/api/v1/siparisler
   -H "Authorization: Bearer {token}"
   -H “Content-Type: application/json"
   -d  '{"urun_adi":"kahve","adet":2}'
    if(success) status_code 201
    else if(unauthorized) status_code 401
    else status_code 400
`
* Cüzdan Bakiye Sorgulama Endpoint'i:
`
   curl -X GET baseURL/api/v1/kullanici/bakiye
   -H "Authorization: Bearer {token}"
   -H "Accept: application/json"
   İf (success) status_code 200 ve response: {"bakiye": 185.50, "para_birimi": "TRY"}
   else status_code 500
`

- SORU:   Mini Mülakat Sorusu (1 Cümleyle Açıklayın): Yukarıdaki GET ve POST isteklerinden hangisi Idempotent (Eşgüçlü) bir istektir, hangisi değildir? Neden?
- CEVAP:  Burdaki post isteği sürekli aynı kayıttan istek oluşturur. Örnek kahveden 100 tane sipariş oluşturabilir.




### GÖREV 3: Clean Code & SOLID Prensip Teşhisi (25 Puan)
      Soru: 1. Bu sınıfta Single Responsibility Principle (SRP - Tek Sorumluluk) nasıl ihlal edilmiştir? Sınıfı hangi küçük parçalara bölmeliyiz? (Kod yazmanıza gerek yoktur, 2 cümleyle açıklayın).
      CEVAP: class KahveSiparisYoneticisi sınfı içerisnde birçok logic işlemler çağrılmış. Bunları ayrı parçalara bölüp o şekilde kullanmak gerekir. Bu şekilde hem bakımı kolaylaşır, hem de solid prensiplerine uyulmuş olunur.
      
      Soru: 2. indirimHesapla fonksiyonunda yarın yeni bir müşteri tipi (örneğin "DOKTOR" ) geldiğinde if-else kodunu değiştirmek zorunda kalmak hangi SOLID prensibine aykırıdır? (Open/Closed Principle - OCP).
      CEVAP: Hocam cevabı siz vermişssiniz zaten. Burda olması gereken öğrenci indirimi ayrı, öğretmen indirimi ayrı olup onlara göre çağırmaktı. Mesela müdür indirimi olduğunda veya herhangi bi grup indirimi olduğunda onun için ayrı bi sınıf oluşturulup kod yapısı if else ile doldurmadan o sınıflar üzerinden gidilebilnirdi


