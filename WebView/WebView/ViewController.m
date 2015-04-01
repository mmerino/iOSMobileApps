//
//  ViewController.m
//  WebView
//
//  Created by Maria Merino on 7/15/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.



#import "ViewController.h"

@interface ViewController (){
    
    __weak IBOutlet UIWebView *WebView;
    __weak IBOutlet UIActivityIndicatorView *activityIndicator;
    __weak IBOutlet UITextField *addressBar;
}
- (IBAction)urlChange:(id)sender;
- (IBAction)back:(id)sender;
- (IBAction)forward:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    addressBar.text = @"http://www.google.com";
    WebView.delegate = self;
    [self loadPage];
    
}
- (void) loadPage{
    [WebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:addressBar.text]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"Did start loading");
    [activityIndicator startAnimating];
}

-(void) webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"Did finish loading");
    //activityIndicator.hidesWhenStopped = YES;
    [activityIndicator stopAnimating];
}


- (IBAction)urlChange:(id)sender {
    [self loadPage];
}

- (IBAction)back:(id)sender {
    if ([WebView canGoBack]){
        [WebView goBack];
    }
}

- (IBAction)forward:(id)sender {
    if ([WebView canGoForward]) {
        [WebView goForward];
    }
}
@end