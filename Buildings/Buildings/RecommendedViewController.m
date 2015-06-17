//
//  RecommendedViewController.m
//  Buildings
//
//  Created by zhangbin on 6/10/15.
//  Copyright (c) 2015 zoombin. All rights reserved.
//

#import "RecommendedViewController.h"
#import "Header.h"
#import "ContactsSimulatorViewController.h"

@interface RecommendedViewController () <UIWebViewDelegate, ContactsSimulatorViewControllerDelegate>

@property (readwrite) UIWebView *webView;

@end

@implementation RecommendedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"推荐";
	
	_webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
	_webView.delegate = self;
	[self.view addSubview:_webView];
	[_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@", WEB_HOST, @"tuijian.html", PARAMETERS]]]];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"测试" style:UIBarButtonItemStylePlain target:self action:@selector(test)];
	
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openContacts) name:OPEN_CONTACTS object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self name:OPEN_CONTACTS object:nil];
}

- (void)openContacts {
	ContactsSimulatorViewController *controller = [[ContactsSimulatorViewController alloc] initWithNibName:nil bundle:nil];
	controller.delegate = self;
	[self presentViewController:[[UINavigationController alloc] initWithRootViewController:controller] animated:YES completion:nil];
}

- (void)test {
	NSString *name = @"张三";
	NSString *phone = @"18662606288";
	NSString *string = [NSString stringWithFormat:@"BrokerWeb.setFromContact('%@', '%@')", name, phone];
	[_webView stringByEvaluatingJavaScriptFromString:string];
	
	string = [NSString stringWithFormat:@"BrokerWeb.setCity('%@', '%@')", name, phone];
	NSLog(@"string: %@", string);
	[_webView stringByEvaluatingJavaScriptFromString:string];
}

#pragma mark - ContactsSimulatorViewControllerDelegate

- (void)didSelectContactWithName:(NSString *)name phone:(NSString *)phone {
	NSString *string = [NSString stringWithFormat:@"BrokerWeb.setFromContact('%@', '%@')", name, phone];
	[_webView stringByEvaluatingJavaScriptFromString:string];
	
	string = [NSString stringWithFormat:@"BrokerWeb.setCity('%@', '%@')", name, @"a38c542ddaf94a32b20160e949792b4b"];
	NSLog(@"string: %@", string);
	[_webView stringByEvaluatingJavaScriptFromString:string];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	if ([_webView canGoBack]) {
		self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:_webView action:@selector(goBack)];
	} else {
		self.navigationItem.leftBarButtonItem = nil;
	}
}


@end
