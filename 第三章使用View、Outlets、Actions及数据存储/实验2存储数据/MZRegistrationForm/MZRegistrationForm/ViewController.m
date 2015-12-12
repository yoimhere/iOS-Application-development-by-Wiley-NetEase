//
//  ViewController.m
//  MZRegistrationForm
//
//  Created by 祝海焜 on 15/12/8.
//  Copyright © 2015年 Matin.Zhou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get document Directory path
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    
    // Build path to the database file
    _databasePath = [[NSString alloc]
    initWithString: [docsDir stringByAppendingPathComponent:@"MZRegistrationForm.sql"]];
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: _databasePath ] == NO)
    {
        const char *dbpath = [_databasePath UTF8String];
        if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
        {
            char *errMsg;
            
    // Adding database if not present
            const char *sql_stmt ="CREATE TABLE IF NOT EXISTS MZRegistrationForm (EnterName text, EnterEmail text, EnterPhone text, EnterCompany text, EnterId text)";
            if (sqlite3_exec(_contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                NSLog(@"Failed to create table");
            }
            
    //Closing database
            sqlite3_close(_contactDB);
        } else {
            NSLog(@"Failed to open/create database");
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)Submit:(id)sender {
    
    // Action when tap on background
    
    NSLog(@"Form Submitted");
    
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO MZRegistrationFrom (Name text, Email text, Phone text, Company text, ID text) VALUES (\"%@\", \"%@\", \"%@\", \"%@\",\"%@\" )",_EnterName.text, _EnterEmail.text,_EnterPhone.text,_EnterCompany.text, _EnterId.text];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_contactDB, insert_stmt,-1, &statement, NULL);
        
        NSLog(@"DB Open");
        
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            _EnterName.text = @"";
            _EnterEmail.text = @"";
            _EnterPhone.text = @"";
            _EnterCompany.text = @"";
            _EnterId.text = @"";
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(_contactDB);
    }
}
@end
