import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subtitle,
      this.onTap});

  final String imageUrl;
  final String title;
  final String subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: CupertinoColors.systemBackground,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: imageUrl),
            ),
            Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(title),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        subtitle,
                        maxLines: 5,
                        style: TextStyle(
                            fontSize: 14,
                            color: CupertinoColors.secondaryLabel),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
