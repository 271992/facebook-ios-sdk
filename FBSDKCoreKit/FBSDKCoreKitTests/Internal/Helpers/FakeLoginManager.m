// Copyright (c) 2014-present, Facebook, Inc. All rights reserved.
//
// You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
// copy, modify, and distribute this software in source code or binary form for use
// in connection with the web services and APIs provided by Facebook.
//
// As with any software that integrates with the Facebook platform, your use of
// this software is subject to the Facebook Developer Principles and Policies
// [http://developers.facebook.com/policy/]. This copyright notice shall be
// included in all copies or substantial portions of the software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "FakeLoginManager.h"

@implementation FBSDKLoginManager

static NSURL *_capturedOpenUrl;
static NSString *_capturedSourceApplication;
static NSString *_capturedAnnotation;
static BOOL _stubbedOpenUrlSuccess;

+ (NSURL *)capturedOpenUrl { return _capturedOpenUrl; }

+ (NSString *)capturedSourceApplication { return _capturedSourceApplication; }

+ (NSString *)capturedAnnotation { return _capturedAnnotation; }

+ (void)setCapturedOpenUrl:(NSURL *)url { _capturedOpenUrl = url; }

+ (void)setCapturedSourceApplication:(NSString *)source { _capturedSourceApplication = source; }

+ (void)setCapturedAnnotation:(NSString *)annotation { _capturedAnnotation = annotation; }

+ (BOOL)stubbedOpenUrlSuccess { return _stubbedOpenUrlSuccess; }

+ (void)setStubbedOpenUrlSuccess:(BOOL)success { _stubbedOpenUrlSuccess = success; }

+ (void)resetTestEvidence
{
  FBSDKLoginManager.capturedOpenUrl = nil;
  FBSDKLoginManager.capturedSourceApplication = nil;
  FBSDKLoginManager.capturedAnnotation = nil;
  FBSDKLoginManager.stubbedOpenUrlSuccess = NO;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
  FBSDKLoginManager.capturedOpenUrl = url;
  FBSDKLoginManager.capturedSourceApplication = sourceApplication;
  FBSDKLoginManager.capturedAnnotation = annotation;

  return FBSDKLoginManager.stubbedOpenUrlSuccess;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {}

- (BOOL)canOpenURL:(NSURL *)url forApplication:(UIApplication *)application sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
  return NO;
}

- (BOOL)isAuthenticationURL:(NSURL *)url
{
  return NO;
}

@end
