import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gigamusculerator/res/widgets/man_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/man_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Bloc _bloc = context.read<ManBloc>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF151515),
      body: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [Color(0xFF151515), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp,
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/gFACE.jpg')
                )
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    onChanged: (value) {
                      if(value.trim() != '') {
                        _bloc.add(ManManificate(value.trim()));
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Мужчинизировать',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 2.5,
                          color: Color(0xFF4C4C4C)
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 2.5,
                          color: Color(0xFF4C4C4C)
                        )
                      )
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 25)
                  ),
                  BlocBuilder<ManBloc, ManState>(
                    builder: (_, state) {
                      if(state is ManLoading) {
                        return const ManCard('Мужики, ожидаем');
                      }

                      if(state is ManEnded) {
                        return Wrap(
                          spacing: 9,
                          runSpacing: 10,
                          children: state.words.map((e) => ManCard(e)).toList(),
                        );
                      }

                      return const ManCard('Мужики, авария');
                    },
                  )
                ],
              ),
            )
          ),
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [Color(0xFF151515), Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.01, 0.8],
                tileMode: TileMode.clamp,
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/gigachad.gif')
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
