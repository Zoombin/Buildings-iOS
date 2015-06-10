//
//  ShareViewController.m
//  Buildings
//
//  Created by zhangbin on 6/11/15.
//  Copyright (c) 2015 zoombin. All rights reserved.
//

#import "ShareViewController.h"
#import "Header.h"

@interface ShareViewController () <UIWebViewDelegate>

@property (readwrite) UIWebView *webView;

@end

@implementation ShareViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		self.title = @"分享";
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
	_webView.delegate = self;
	[self.view addSubview:_webView];
	[_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@", WEB_HOST, @"share/building_detail.html", PARAMETERS]]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
