import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abs_customer_sites/application/admin_panel/ticket_reply/ticket_reply_bloc.dart';

class AttachedFileCard extends StatelessWidget {
  final PlatformFile file;
  AttachedFileCard({@required this.file});
  @override
  Widget build(BuildContext context) {
    print('File is ${file.name}');
    return BlocBuilder<TicketReplyBloc, TicketReplyState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue[50],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      file.name,
                      style: TextStyle(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -7,
                right: -7,
                child: InkWell(
                  onTap: () {
                    context
                        .read<TicketReplyBloc>()
                        .add(TicketReplyFileDeleted(platformFile: file));
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red[300],
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
