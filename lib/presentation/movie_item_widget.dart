import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      this.onTap});

  final String imageUrl;
  final String title;
  final String description;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.sizeOf(context).height * .22,
        color: CupertinoColors.systemBackground,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        description,
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
