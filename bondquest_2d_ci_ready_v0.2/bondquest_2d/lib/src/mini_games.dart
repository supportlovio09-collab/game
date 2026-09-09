import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'models.dart';

class MiniGamePage extends StatelessWidget {
  const MiniGamePage({super.key, required this.zone, required this.mode});
  final WorldZone zone;
  final PlayMode mode;
  @override Widget build(BuildContext context) => switch (zone.game) {
    MiniGameType.heartCatch => HeartCatchPage(zone: zone),
    MiniGameType.memoryMatch => MemoryMatchPage(zone: zone),
    MiniGameType.rapidTap => RapidTapPage(zone: zone),
  };
}

class GameShell extends StatelessWidget {
  const GameShell({super.key, required this.title, required this.subtitle, required this.child});
  final String title, subtitle; final Widget child;
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(title, style: const TextStyle(fontWeight: FontWeight.w900))), body: SafeArea(child: Padding(padding: const EdgeInsets.all(20), child: Column(children: [Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF716B79), height: 1.4)), const SizedBox(height: 18), Expanded(child: child)]))));
}

class HeartCatchPage extends StatefulWidget { const HeartCatchPage({super.key, required this.zone}); final WorldZone zone; @override State<HeartCatchPage> createState()=>_HeartCatchPageState(); }
class _HeartCatchPageState extends State<HeartCatchPage> {
  final random=Random(); int score=0, seconds=15; Offset heart=const Offset(.5,.5); Timer? timer;
  @override void initState(){super.initState(); timer=Timer.periodic(const Duration(seconds:1),(t){if(!mounted)return; if(seconds<=1){t.cancel(); Navigator.pop(context,score);}else setState(()=>seconds--);});}
  @override void dispose(){timer?.cancel();super.dispose();}
  @override Widget build(BuildContext context)=>GameShell(title:'💜 Heart Catch',subtitle:'15 सेकंदांत जास्तीत जास्त hearts पकडा.',child:LayoutBuilder(builder:(context,c)=>Stack(children:[Positioned(top:0,left:0,right:0,child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text('Score $score',style:const TextStyle(fontWeight:FontWeight.w900)),Text('${seconds}s',style:const TextStyle(fontWeight:FontWeight.w900))])),AnimatedPositioned(duration:const Duration(milliseconds:130),left:heart.dx*(c.maxWidth-66),top:55+heart.dy*(c.maxHeight-121),child:Semantics(button:true,label:'Catch heart',child:GestureDetector(onTap:()=>setState((){score+=5;heart=Offset(random.nextDouble(),random.nextDouble());}),child:const SizedBox(width:66,height:66,child:Center(child:Text('💜',style:TextStyle(fontSize:46)))))))])));
}

class MemoryMatchPage extends StatefulWidget { const MemoryMatchPage({super.key,required this.zone});final WorldZone zone;@override State<MemoryMatchPage> createState()=>_MemoryMatchPageState();}
class _MemoryMatchPageState extends State<MemoryMatchPage>{
 late List<String> cards; final Set<int> open={},done={}; int moves=0;
 @override void initState(){super.initState();cards=['💜','⭐','🏠','🎁','💜','⭐','🏠','🎁']..shuffle();}
 void tap(int i){if(open.length==2||open.contains(i)||done.contains(i))return;setState(()=>open.add(i));if(open.length==2){moves++;final x=open.toList();if(cards[x[0]]==cards[x[1]]){Future.delayed(const Duration(milliseconds:350),(){if(!mounted)return;setState((){done.addAll(x);open.clear();});if(done.length==8)Future.delayed(const Duration(milliseconds:250),()=>mounted?Navigator.pop(context,max(10,60-moves*3)):null);});}else{Future.delayed(const Duration(milliseconds:650),()=>mounted?setState(open.clear):null);}}}
 @override Widget build(BuildContext context)=>GameShell(title:'🌳 Memory Forest',subtitle:'सगळ्या matching pairs शोधा.',child:Column(children:[Text('Moves $moves',style:const TextStyle(fontWeight:FontWeight.w900)),const SizedBox(height:18),Expanded(child:GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,crossAxisSpacing:12,mainAxisSpacing:12),itemCount:cards.length,itemBuilder:(c,i){final show=open.contains(i)||done.contains(i);return InkWell(onTap:()=>tap(i),borderRadius:BorderRadius.circular(18),child:AnimatedContainer(duration:const Duration(milliseconds:180),decoration:BoxDecoration(color:show?const Color(0xFFE9E1FF):const Color(0xFF7257D3),borderRadius:BorderRadius.circular(18)),child:Center(child:Text(show?cards[i]:'?',style:const TextStyle(fontSize:38,fontWeight:FontWeight.w900,color:Colors.white)))));} ))]));
}

class RapidTapPage extends StatefulWidget { const RapidTapPage({super.key,required this.zone});final WorldZone zone;@override State<RapidTapPage> createState()=>_RapidTapPageState(); }
class _RapidTapPageState extends State<RapidTapPage>{int taps=0,seconds=10;Timer? timer;bool started=false;void start(){setState(()=>started=true);timer=Timer.periodic(const Duration(seconds:1),(t){if(seconds<=1){t.cancel();Navigator.pop(context,taps);}else setState(()=>seconds--);});}@override void dispose(){timer?.cancel();super.dispose();}@override Widget build(BuildContext context)=>GameShell(title:'⚡ Challenge Arena',subtitle:'10 सेकंदांत energy orb वर rapid tap करा.',child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text(started?'${seconds}s':'Ready?',style:const TextStyle(fontSize:28,fontWeight:FontWeight.w900)),const SizedBox(height:28),GestureDetector(onTap:(){if(!started)start();setState(()=>taps++);},child:Container(width:190,height:190,decoration:const BoxDecoration(shape:BoxShape.circle,gradient:LinearGradient(colors:[Color(0xFFFFB44D),Color(0xFF7257D3)]),boxShadow:[BoxShadow(color:Color(0x447257D3),blurRadius:26)]),child:Center(child:Text(started?'$taps':'START',style:const TextStyle(color:Colors.white,fontSize:32,fontWeight:FontWeight.w900))))),const SizedBox(height:28),const Text('दोन्ही players/team आलटून-पालटून प्रयत्न करा.',textAlign:TextAlign.center)]) );}
