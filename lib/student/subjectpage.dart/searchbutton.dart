import 'package:flutter/material.dart';

class SearchBarSubject extends StatelessWidget {
  const SearchBarSubject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 300,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 245, 246, 245),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Search Subjects',
                  suffixIcon: IconButton(
                      onPressed: () async {}, icon: const Icon(Icons.search)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        ),
      ],
    );
  }
}
