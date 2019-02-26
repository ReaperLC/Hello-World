//
//  RootModel.h
//  Runtime的使用
//
//  Created by 刘灿 on 2019/1/8.
//  Copyright © 2019 刘灿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "Author.h"
@interface RootModel : NSObject
@property (nonatomic, copy) NSString *iconurl;
@property (nonatomic, copy) NSString *subhead;
@property (nonatomic, copy) NSString *storyname;
@property (nonatomic, strong) Author *author;
@property (nonatomic, strong) NSArray<Book *> *books;
@end

