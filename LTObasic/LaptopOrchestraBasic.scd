s.boot;
(
~ips = ();
~ips[\elijah] = NetAddr("143.117.78.123", 57120);
~ips[\peter] = NetAddr("143.117.78.91", 57120);
~ips[\sara] = NetAddr("143.117.78.91", 57120);
~ips[\mathew] = NetAddr("143.117.78.91", 57120);
~ips[\ronanX] = NetAddr("143.117.78.91", 57120);
~ips[\ronan1] = NetAddr("143.117.78.91", 57120);
~ips[\ronan1] = NetAddr("143.117.78.91", 57120);
~ips[\kerry] = NetAddr("143.117.78.91", 57120);
~ips[\celan] = NetAddr("143.117.78.91", 57120);
~ips[\joseph] = NetAddr("143.117.78.91", 57120);

~mysamps = SoundFile.collectIntoBuffers( "/Volumes/MEDIA/JAM4/samples/"  ++ "*");
~mysamps = SoundFile.collectIntoBuffers( "/Volumes/Ute/Science Festival SARC 21 Feb 2015/samples/"  ++ "*");
SynthDef(\sampler_mono, {
	arg buf, starttime=0, rate=1;
	var samp, startpos;
	startpos = starttime*44100;
	samp = PlayBuf.ar(1, buf, rate:rate, startPos:startpos, loop:0, doneAction:2);
	Out.ar(0, samp);
}).add;




OSCdef(\playsamp, {|msg| Synth(\sampler_mono, [\buf, ~mysamps[msg[1].asInteger] ])}, "/playsamp");

w = Window.new("Laptop Orchestra", Rect(0, 0, Window.screenBounds.width, Window.screenBounds.height));
w.view.keyDownAction = {
	arg view, char, modifiers, unicode, keycode;
	switch( keycode,
		/*1*/	18, {
			fork{
				///////////////////////////////////////
				/////////// CHANGE HERE ///////////////
				~ips[\elijah].sendMsg("/playsamp", 0);
				2.wait;
				~ips[\elijah].sendMsg("/playsamp", 0);
				///////////////////////////////////////
				///////////////////////////////////////
			}
		},

		/*2*/	19, {
			fork{
				///////////////////////////////////////
				/////////// CHANGE HERE ///////////////
				~ips[\elijah].sendMsg("/playsamp", 0);
				2.wait;
				~ips[\elijah].sendMsg("/playsamp", 0);
				///////////////////////////////////////
				///////////////////////////////////////
			}
		},

		/*3*/	20, {
			fork{
				///////////////////////////////////////
				/////////// CHANGE HERE ///////////////
				~ips[\elijah].sendMsg("/playsamp", 0);
				2.wait;
				~ips[\elijah].sendMsg("/playsamp", 0);
				///////////////////////////////////////
				///////////////////////////////////////
			}
		},

		/*4*/	21, {
			fork{
				///////////////////////////////////////
				/////////// CHANGE HERE ///////////////
				~ips[\elijah].sendMsg("/playsamp", 0);
				2.wait;
				~ips[\elijah].sendMsg("/playsamp", 0);
				///////////////////////////////////////
				///////////////////////////////////////
			}
		},

		/*5*/	23, {
			fork{
				///////////////////////////////////////
				/////////// CHANGE HERE ///////////////
				~ips[\elijah].sendMsg("/playsamp", 0);
				2.wait;
				~ips[\elijah].sendMsg("/playsamp", 0);
				///////////////////////////////////////
				///////////////////////////////////////
			}
		}

	);
};
w.view.background_(Color.white);
w.front;

)
