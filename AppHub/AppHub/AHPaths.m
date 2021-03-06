//
//  AHPaths.m
//  AppHub
//
//  Copyright (c) 2015 AppHub. All rights reserved.
//

#import "AHPaths.h"

#import "AHConstants.h"

NSString *ahGroupIdentifier = nil;

NSURL *AHBuildDirectory(NSString *buildID)
{
    return [AHBuildsDirectory() URLByAppendingPathComponent:buildID isDirectory:YES];
}

NSURL *AHBundleDirectory(NSString *buildID)
{
    return [AHBuildDirectory(buildID) URLByAppendingPathComponent:AHIOSBundleName];
}

NSURL *AHCurrentBuildInfoDirectory(void)
{
    return [AHRootDirectory() URLByAppendingPathComponent:AHCurrentBuildInfoName isDirectory:YES];
}

NSURL *AHBuildsDirectory(void)
{
    return [AHRootDirectory() URLByAppendingPathComponent:AHBuildDirectoryName isDirectory:YES];
}

NSURL *AHRootDirectory(void)
{
    if(ahGroupIdentifier == nil) {
        return [[[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject] URLByAppendingPathComponent:AHDirectoryName isDirectory:YES];
    } else {
        return [[[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:ahGroupIdentifier] URLByAppendingPathComponent: AHDirectoryName isDirectory:YES];
    }
}
