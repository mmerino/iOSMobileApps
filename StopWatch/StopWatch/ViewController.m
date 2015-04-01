//
//  ViewController.m
//  StopWatch
//


#import "ViewController.h"

@interface ViewController (){
    int                 _ticks;
    int                 _pauseTicks;
    NSTimer             *mainTimer;
    int                 check;
    int                 value;
    int                 stringMinuteValue;
    int                 stringSecondValue;
    __weak IBOutlet     UILabel *stopWatchTimeLabel;
    __weak IBOutlet     UIButton *pauseButton;
    __weak IBOutlet UITextField *minuteTextField;
    __weak IBOutlet UITextField *secondsTextField;

}
- (IBAction)start:(id)sender;
- (IBAction)pause:(id)sender;
- (IBAction)stop:(id)sender;
- (IBAction)timer:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    stopWatchTimeLabel.font = [UIFont fontWithName:@"AtariClassicChunky" size:36.0];
    //[stopWatchTimeLabel setFont: [UIFont fontWithName: @"Intellect" size: stopWatchTimeLabel.font.pointSize]];
    check = 0;

}

- (void)timerTick
{
    if (check == 0) {
        _ticks++;
        int miliseconds = fmod(_ticks, 100);
        int seconds = fmod((_ticks / 100), 60);
        int minutes = (_ticks / 6000);
        stopWatchTimeLabel.text = [NSString stringWithFormat:@"%02i:%02i:%02i", minutes, seconds, miliseconds];
    }else {
        _ticks--;
        int miliseconds = fmod(_ticks, 100);
        int seconds = fmod((_ticks / 100), 60);
        int minutes = (_ticks / 6000);
        stopWatchTimeLabel.text = [NSString stringWithFormat:@"%02i:%02i:%02i", minutes, seconds, miliseconds];
        if (_ticks <= 0){
            stopWatchTimeLabel.text = [NSString stringWithFormat:@"00:00:00"];
            [mainTimer invalidate];
            _ticks = 0;
            check = 0;
            _pauseTicks = 0;
            mainTimer = nil;
        }
    }
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender {
    if ((_ticks == 0)||(_pauseTicks > 0) ){
        _ticks = _ticks + _pauseTicks;
        _pauseTicks = 0;
        mainTimer = [NSTimer scheduledTimerWithTimeInterval:.01f target:self selector:@selector(timerTick) userInfo:nil repeats:YES];
        pauseButton.enabled = true;
        minuteTextField.text = @"";
        secondsTextField.text = @"";
    }
}

- (IBAction)pause:(id)sender {
    _pauseTicks = _ticks;
    _ticks = 0;
    [mainTimer invalidate];
    mainTimer = nil;
    pauseButton.enabled = false;
}

- (IBAction)stop:(id)sender {
    stopWatchTimeLabel.text = [NSString stringWithFormat:@"00:00:00"];
    
    /* test for string to int conversion
    NSString *string = [NSString stringWithFormat:@"4010010"];
    value = [string intValue];
    NSLog(@"%i",value);
    */
    
    [mainTimer invalidate];
    _ticks = 0;
    check = 0;
    _pauseTicks = 0;
    mainTimer = nil;
}

- (IBAction)timer:(id)sender {
    check = 1;
    stringMinuteValue = [minuteTextField.text intValue];
    stringMinuteValue = stringMinuteValue * 6000;
    stringSecondValue = [secondsTextField.text intValue];
    stringSecondValue = stringSecondValue * 100;
    value = stringMinuteValue + stringSecondValue;
    _pauseTicks = value;
    [self.view endEditing:YES];
    
}
@end
