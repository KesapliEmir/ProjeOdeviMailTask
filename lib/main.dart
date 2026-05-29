import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Posta & Görevler',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFDF8F7)),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // 0 posta 1 görevler

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- üst bar sadece posta sekmesinde görünür ---
      appBar: _currentIndex == 0
          ? AppBar(
              backgroundColor: const Color(0xFFFDF8F7),
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black87),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              title: const Text(
                'Gelen Kutusu',
                style: TextStyle(color: Colors.black87, fontSize: 20),
              ),
            )
          : null,

      // --- sol açılır menü drawer ---
      drawer: Drawer(
        child: Container(
          color: const Color(0xFFFFF5F3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // kırmızı profil alanı
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 16,
                  bottom: 24,
                  right: 16,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFFF14635),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Text(
                        'EK',
                        style: TextStyle(
                          color: Color(0xFFF14635),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Emirhan Kaplan',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'g952906@gmail.com',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // menü elemanları tıklanamaz
              AbsorbPointer(
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(
                        Icons.crop_square_sharp,
                        color: Color(0xFF7A2E22),
                      ),
                      title: Text(
                        'Gelen Kutusu',
                        style: TextStyle(
                          color: Color(0xFF7A2E22),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.send_sharp, color: Color(0xFF534341)),
                      title: Text(
                        'Gönderilenler',
                        style: TextStyle(color: Color(0xFF534341)),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.drafts_sharp,
                        color: Color(0xFF534341),
                      ),
                      title: Text(
                        'Okundu',
                        style: TextStyle(color: Color(0xFF534341)),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.delete_sharp,
                        color: Color(0xFF534341),
                      ),
                      title: Text(
                        'Çöp Kutusu',
                        style: TextStyle(color: Color(0xFF534341)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // --- ana gövde ---
      body: IndexedStack(
        index: _currentIndex,
        children: [_buildPostaSekmesi(), _buildGorevlerSekmesi()],
      ),

      // --- tıklanamaz sağ alttaki kalem ikonu her iki sekmede de aynı görünüyor ---
      floatingActionButton: AbsorbPointer(
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFFEAE2E0), // görseldeki gri bej tonu
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons
                .edit_outlined, // ikon posta sekmesindeki gibi kalem ikonu yapıldı
            color: Color(0xFF49454F),
          ),
        ),
      ),

      // --- alt menü ---
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black12, width: 0.5)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: const Color(0xFFFDF8F7),
          selectedItemColor: const Color(0xFF7A2E22),
          unselectedItemColor: const Color(0xFF534341),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Posta'),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_turned_in_outlined),
              label: 'Görevler',
            ),
          ],
        ),
      ),
    );
  }

  // --- 1 posta sekmesi ---
  Widget _buildPostaSekmesi() {
    final List<Map<String, dynamic>> mailler = [
      {
        'ad': 'Giresun Belediyesi',
        'ozet':
            'Staj Raporu: Lütfen ekteki dosyaları inceleyerek geri bildirimde bulunun. Raporun son teslim tarihi yaklaşıyor.',
        'renk': const Color(0xFF2196F3),
        'harf': 'G',
      },
      {
        'ad': 'Trendyol',
        'ozet':
            'İndirim Kuponu: Tebrikler! Size özel %30 indirim kuponunuzu tanımladık. Bu fırsatı kaçırmayın, sepette kullanın. Son gün 12 Mayıs.',
        'renk': const Color(0xFFFF9800),
        'harf': 'T',
      },
      {
        'ad': 'Instagram',
        'ozet':
            'Yeni Giriş: Hesabınıza Giresun, Türkiye konumundan yeni bir giriş yapıldı. Bu siz değilseniz lütfen şifrenizi hemen değiştirin.',
        'renk': const Color(0xFFE91E63),
        'harf': 'I',
      },
      {
        'ad': 'Emirhan Kaplan',
        'ozet':
            'Final Haftası Ders Notları: Hazırladığım tüm ders notlarını ve özetleri içeren klasörü bu bağlantıda bulabilirsiniz. Başarılar.',
        'renk': const Color(0xFF4CAF50),
        'harf': 'E',
      },
      {
        'ad': 'Kartal Yuvası',
        'ozet':
            'Yeni Sezon Formaları!: Merakla beklenen yeni sezon Beşiktaş formalarımız satışa çıktı! Hemen inceleyin ve sipariş verin. Sınırlı stoklar.',
        'renk': Colors.black,
        'harf': 'K',
      },
    ];

    return Column(
      children: [
        // tıklanamaz arama çubuğu
        AbsorbPointer(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF5F3),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(Icons.search, color: Color(0xFF534341)),
                  ),
                  Text(
                    'İletilerde ara...',
                    style: TextStyle(color: Color(0xFF7E7472), fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // mesaj listesi
        Expanded(
          child: ListView.separated(
            itemCount: mailler.length,
            separatorBuilder: (context, index) =>
                const Divider(height: 1, color: Colors.black12),
            itemBuilder: (context, index) {
              final mail = mailler[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: mail['renk'],
                  child: Text(
                    mail['harf'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  mail['ad'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text(
                  mail['ozet'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // --- 2 görevler sekmesi ---
  Widget _buildGorevlerSekmesi() {
    final List<Map<String, dynamic>> gorevListesi = [
      {
        'metin': 'Giresun Belediyesi staj raporu tamamlanıp teslim edilecek.',
        'renk': const Color(0xFF673AB7),
      },
      {
        'metin': 'Database programlama ders notları temize çekilecek.',
        'renk': const Color(0xFF009688),
      },
      {
        'metin': 'Beşiktaş JK derbi maçı hatırlatması kontrol edilecek.',
        'renk': const Color(0xFF3F51B5),
      },
      {
        'metin': 'Flutter projesindeki Firebase API entegrasyonu tamamlanacak.',
        'renk': const Color(0xFFFF5722),
      },
      {
        'metin': 'Web tasarımı ödevi için arayüz şablonu çıkarılacak.',
        'renk': const Color(0xFF9C27B0),
      },
      {
        'metin': 'Kütüphaneden alınan kitapların iade tarihi kontrol edilecek.',
        'renk': const Color(0xFF4CAF50),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF8F7),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 70, // başlık ve alt metin sığsın diye alan genişletildi
        title: Row(
          children: [
            const Icon(
              Icons.task_alt_rounded,
              color: Color(0xFF7A2E22),
              size: 32,
            ),
            const SizedBox(width: 12),
            // başlık ve alt metin dikey olarak hizalandı
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'MailTask Görevleri',
                  style: TextStyle(
                    color: Color(0xFF7A2E22),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 2),
                // istenen tamamlanan görevler yazısı eklendi
                Text(
                  'Tamamlanan görevler %0',
                  style: TextStyle(
                    color: Color(0xFF534341),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        itemCount: gorevListesi.length,
        itemBuilder: (context, index) {
          final gorev = gorevListesi[index];
          final String ilkHarf = gorev['metin'].substring(0, 1).toUpperCase();

          return Card(
            color: const Color(0xFFFFF5F3),
            elevation: 1,
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: gorev['renk'],
                  radius: 22,
                  child: Text(
                    ilkHarf,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                title: Text(
                  gorev['metin'],
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
