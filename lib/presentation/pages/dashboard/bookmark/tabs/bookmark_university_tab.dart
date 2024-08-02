import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';

class BookmarkUniversityTab extends StatefulWidget {
  const BookmarkUniversityTab({super.key});

  @override
  State<BookmarkUniversityTab> createState() => _BookmarkUniversityTabState();
}

class _BookmarkUniversityTabState extends State<BookmarkUniversityTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(Dimen.contentPadding),
        itemCount: 2,
        itemBuilder: (context, index) {
          return ItemBookmarkUniversity(
            imageUrl:
                'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAflBMVEX///8VJ0tka3wLIkdIUGkAHkYQJElhZ3lOVmwAGUOZnqcAFUEnNVSFi5r8/P329/eWmqaKj5oAADiytrwAFEIADz/q6+0gL1IhMFCqrrWjp6/x8/IACT0AADMAHkXc3d82Ql4AACtXXnLBwsg3RGAuPFre4eMAADbU1tpSWW+oi7nnAAACm0lEQVR4nO3abXeaMBiAYdGJVdxErPgCOud0a///H5ynQnh4SYI2dEfPfX00EXNbtBrs9QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB5S3Dc7xqXp4ah52ltp1kIzKzMKS7NnR8sa8qX8vivwFAyNdqXCMBruGybtx6ufctokMh80msvZyc48W91rc0/geeiZRbIwjHTTBnuZOAksR01lYqI9atnyjkJ7YKkwTPXzBkORaC0sJXZYmNgDZaEp8JIoTlR7oUzsrjA+2ANF4dwYeElcq8QWhSKxs8KkTWBRGEa+ZerA+3NDoafebroqFK/BgUH+XjpXy/Brc9Rx0ixxkhqOqJ6oPDHZNY9XV3bje6kI9L8ZHK6FYZo/sH+uTnkpFuRfT9TtyXDEs0rITtTkUBqfisTSwGlxU+FG/E1i6+zZSj1sENZGizUF3+2PXJzCvj9rGJ+P1fj0R4sSncWyeOZbFE7bFY5bFG5fVcHqiwr3zguTuFCbPbEVBg9QGP6KMn+DWsRTFIqX2prCGgrborCMQgqlhyh8226k9fMVbndL4bX4qPw8hWqRFRRSSCGFFLYunKjvfx+e8L+F/A5/8YSfaSpuK7Tu0zgq3BQ72O53omRhbZGisHmvzVFhPBX7pS96p/hThZ5XPeD7obpf2lGhTLTveX+iUL/nnTZvPTorbHNpzcuvW3yiUEsT6LCwXWJnhbpAl4XyRP3yQm2g08I2iR0V6gPdFra+ju+60BDouLAXH8y/xdhn76WrcX5LWi9cq8FlVpiaf1VhCuzN1Z3HKweFvXhk9n4t7KsbjvXrlGJw+3HD4mg+aOP/wdy2uHPfRSEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMB/8w+0Glk4PfGeoQAAAABJRU5ErkJggg==',
            name: 'CADT',
            location: 'Phnom  Penh',
            onTap: () {},
          );
        },
      ),
    );
  }
}
