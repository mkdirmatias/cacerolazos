// Flutter imports
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

// App imports
import 'package:cacerola/src/pages/Info/info_page.dart';

class HomePage extends StatefulWidget
{
    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
    // Control de audio
    AudioPlayer audioPlayer;
    AudioCache audioCache;

    // Estado botones
    bool _play=true,_pause=false,_resume=false,_stop=false;

    @override
    void initState()
    {
        super.initState();
        audioPlayer = new AudioPlayer();
        audioCache = new AudioCache(fixedPlayer: audioPlayer);
    }
    
    @override
    Widget build(BuildContext context)
    {
        // Size dispositivo
        Size size = MediaQuery.of(context).size;

        return Scaffold(
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.info),
                onPressed: (){
                    final route = MaterialPageRoute( builder: (context) => InfoPage()
                        );
                    Navigator.push(context, route);
                },
            ),
            body: ListView(
                padding: EdgeInsets.all(50.0),

                children: <Widget>[
                    SizedBox(height: 20.0,),

                    SizedBox(height: 20.0),

                    Image(
                        image: AssetImage('lib/src/assets/img/logo.png'),
                        height: size.width/2,
                    ),
                    
                    SizedBox(height: 20.0),
                    
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            GestureDetector(
                                child: ClipOval(
                                    child: Container(
                                        color: _play ? Colors.blue : Colors.grey,
                                        height: 60.0,
                                        width: 60.0,
                                        child: Center(child: Icon(Icons.play_arrow, color: Colors.white,),),
                                    ),
                                ),
                                onTap: ()
                                {
                                    if(_resume)
                                    {
                                        resume();
                                    }
                                    else
                                    {
                                        play();
                                    }

                                    setState(()
                                    {
                                        _play = false;
                                        _pause = true;
                                        _stop = true;
                                        _resume = true;
                                    });
                                },
                            ),

                            SizedBox(width: 10.0),
                            
                            GestureDetector(
                                child: ClipOval(
                                    child: Container(
                                        color: _pause ? Colors.blue : Colors.grey,
                                        height: 60.0,
                                        width: 60.0,
                                        child: Center(child: Icon(Icons.pause, color: Colors.white,),),
                                    ),
                                ),
                                onTap: ()
                                {
                                    pause();

                                    setState(()
                                    {
                                        _play = true;
                                        _pause = false;
                                        _stop = true;
                                        _resume = true;
                                    });
                                },
                            ),

                            SizedBox(width: 10.0),
                            
                            GestureDetector(
                                child: ClipOval(
                                    child: Container(
                                        color: _stop ? Colors.blue : Colors.grey,
                                        height: 60.0,
                                        width: 60.0,
                                        child: Center(child: Icon(Icons.stop, color: Colors.white,),),
                                    ),
                                ),
                                onTap: ()
                                {
                                    stop();

                                    setState(()
                                    {
                                        _play = true;
                                        _pause = false;
                                        _resume = false;
                                        _stop = false;
                                    });
                                },
                            ),
                        ],
                    )
                ],
            )
        );
    }

    // Reproducir audio inicial
    play() async
    {
        await audioCache.loop('cacerolazo2.mp3');
    }

    // Pausar Audio
    pause() async
    {
        await audioPlayer.pause();
    }

    // Retomar audio desde donde se hizo pause
    resume() async
    {
        await audioPlayer.resume();
    }

    // Parar el audio
    stop() async
    {
        await audioPlayer.stop();
    }
}