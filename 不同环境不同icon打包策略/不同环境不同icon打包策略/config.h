//
//  config.h
//  不同环境不同icon打包策略
//
//  Created by 刘灿 on 2019/2/25.
//  Copyright © 2019 新点软件有限公司. All rights reserved.
//


#ifdef DEBUG //开发环境

#define AlertBody   @"这是开发环境"

#elif PREFORM //预发环境

#define AlertBody   @"这是预发环境"

#else //正式环境

#define AlertBody   @"这是正式环境"

#endif
