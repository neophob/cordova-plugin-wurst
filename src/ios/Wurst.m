/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

#import "Wurst.h"
/* #import "CDV.h"
*/
@implementation Wurst

- (void)pluginInitialize {
    [super pluginInitialize];
    NSLog(@"Hello World Wurst, init");
}

- (void)echoTest:(CDVInvokedUrlCommand*)command {
    NSLog(@"Wurst, command");
    id message = [command.arguments objectAtIndex:0];
    NSLog(@"Wurst, parameter <%@>", message);
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:message];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)backgroundJobTest:(CDVInvokedUrlCommand*)command {
    NSLog(@"Wurst, backgroundJobTest");
    [self.commandDelegate runInBackground:^{
	NSString* payload = nil;
	
	// Some blocking logic...
	NSLog(@"Wurst, sleep for 5s");
	[NSThread sleepForTimeInterval:5.0];
	NSLog(@"Wurst, sleep done");
	
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:payload];
	// The sendPluginResult method is thread-safe.
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
    NSLog(@"return from backgroundJobTest");
}

- (void)onAppTerminate {
    NSLog(@"Wurst, onAppTerminate");

}

- (void)onMemoryWarning {
    NSLog(@"Wurst, onMemoryWarning");

}

- (void)onReset {
    NSLog(@"Wurst, onReset");
}

- (void)dispose {
    NSLog(@"Wurst, dispose");
}

@end
