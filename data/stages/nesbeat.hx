import openfl.Lib;
var blackBarThingie:FlxSprite;
var vcrshader:FunkinShader;
var time:Float=0;

function onCountdown(event:CountdownEvent) event.cancelled = true;

// i will reorganize this code later - apurples
function create() {
        dad.alpha = 0;
        Lib.application.window.title="Friday Night Funkin': Mario's Madness | Unbeatable | RedTV53 ft. theWAHbox, scrumbo_, FriedFrick & Ironik";
        bg.screenCenter();
	bg.alpha = 0;
        bg.antialiasing = true;
        add(bg);
        FlxTween.tween(bg, {angle: 360}, 40, {ease: FlxEase.smootherStepInOut, type: FlxTween.PINGPONG});

        blackBarThingie = new FlxSprite().makeSolid(FlxG.width, FlxG.height, FlxColor.BLACK);
        blackBarThingie.setGraphicSize(Std.int(blackBarThingie.width + 100));
        blackBarThingie.scrollFactor.set(0, 0);
        blackBarThingie.screenCenter();
        add(blackBarThingie);

       // vcrshader=new FunkinShader(Assets.getText(Paths.fragShader("VCR"))); <-- this is the TV shader that was used in the song, but i dunno how shader works so i'll leave it here for someone else to check : )))
       // camGame.addShader(vcrshader);
}

function postCreate(){
        camHUD.alpha=0;
}
function update(elapsed:Float){
 // time += elapsed;

     //   vcrshader.shader.time = time;
}
var dummyvar = 0;
function postUpdate(elapsed:Float) {
    switch(curCameraTarget) {
        case 0:
                dad.visible = true;
                boyfriend.visible = false;
                gf.visible = false;
                    
                if (dummyvar != -1) {
		        blackBarThingie.alpha = 0.3;
                        FlxTween.tween(blackBarThingie, {alpha: 0},1, {ease: FlxEase.linear, type: FlxTween.ONESHOT});    
            	        dummyvar = -1;
                }

                alreadychange = false;
        case 1:
                dad.visible = false;
                boyfriend.alpha = 1;
                boyfriend.visible = true;
                gf.visible = true;
                gf.alpha = 1;      
                if (dummyvar != 1) {
		        blackBarThingie.alpha = 0.3;
                        FlxTween.tween(blackBarThingie, {alpha: 0},1, {ease: FlxEase.linear, type: FlxTween.ONESHOT});    
                        dummyvar = 1;
                }
    }
}

function beatHit(curBeat)
{
	if (curBeat == 0) FlxTween.tween(bg, {alpha: 0.8}, 16, {ease: FlxEase.linear, type: FlxTween.ONESHOT});
}
function stepHit(curStep){
        switch(curStep){
                case 109:FlxTween.tween(camHUD,{alpha:1},2.5,{ease:FlxEase.quadIn});
        }
}

function START() dad.alpha = 1;
