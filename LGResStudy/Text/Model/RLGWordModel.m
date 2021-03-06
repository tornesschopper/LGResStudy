//
//  DLGWordModel.m
//  LGDicDemo
//
//  Created by 刘亚军 on 2018/4/4.
//  Copyright © 2018年 刘亚军. All rights reserved.
//

#import "RLGWordModel.h"
#import "RLGCommon.h"

@implementation SenCollectionModel
-(void)setSentenceEn:(NSString *)sentenceEn{
    _sentenceEn = sentenceEn;
    _sentenceEn_attr = RLG_AttributedString(sentenceEn, 15);
}
-(void)setSTranslation:(NSString *)sTranslation{
    _sTranslation = sTranslation;
    _sTranslation_attr = RLG_AttributedString(sTranslation, 14);
}
@end

@implementation ColtCollectionModel
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"senCollection":[SenCollectionModel class]};
}
//-(void)setColtEn:(NSString *)coltEn{
//    _coltEn = coltEn;
//    _coltEn_attr = RLG_AttributedString(coltEn, 15);
//
//}
//-(void)setColtCn:(NSString *)coltCn{
//    _coltCn = coltCn;
//    _coltCn_attr = RLG_AttributedString(coltCn, 14);
//}
@end

@implementation RltCollectionModel
//-(void)setTitle:(NSString *)title{
//    _title = title;
//    _title_attr = RLG_AttributedString(title, 15);
//}
//-(void)setContent:(NSString *)content{
//    _content = content;
//    _content_attr = RLG_AttributedString(content, 14);
//}
@end

@implementation ClassicCollectionModel
//-(void)setTitle:(NSString *)title{
//    _title = title;
//    _title_attr = RLG_AttributedString(title, 15);
//}
//-(void)setContent:(NSString *)content{
//    _content = content;
//    _content_attr = RLG_AttributedString(content, 14);
//}
@end

@implementation MeanCollectionModel
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"coltCollection":[ColtCollectionModel class],
             @"rltCollection":[RltCollectionModel class],
             @"senCollection":[SenCollectionModel class],
             @"classicCollection":[ClassicCollectionModel class]
             };
}
//-(void)setChineseMeaning:(NSString *)chineseMeaning{
//    _chineseMeaning = chineseMeaning;
//    _chineseMeaning_attr = RLG_AttributedString(chineseMeaning, 15);
//}
//-(void)setEnglishMeaning:(NSString *)englishMeaning{
//    _englishMeaning = englishMeaning;
//    _englishMeaning_attr = RLG_AttributedString(englishMeaning, 14);
//}
@end

@implementation CxCollectionModel
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"meanCollection":[MeanCollectionModel class]};
}
@end

@implementation RLGWordModel
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"cxCollection":[CxCollectionModel class]};
}

- (NSString *)wordChineseMean{
    NSString *meaning = @"";
    int i = 0;
    for (CxCollectionModel *cxModel in self.cxCollection) {
        if (i!=0) {
            meaning = [meaning stringByAppendingString:@"\n"];
        }
        meaning = [meaning stringByAppendingString:cxModel.cxEnglish];
        for (MeanCollectionModel *meanModel in cxModel.meanCollection) {
            meaning = [meaning stringByAppendingString:meanModel.chineseMeaning];
        }
        i++;
    }
    return meaning;
}
- (NSArray *)wordSenCollection{
    NSMutableArray *senArr = [NSMutableArray array];
    for (CxCollectionModel *cxModel in self.cxCollection) {
        for (MeanCollectionModel *meanModel in cxModel.meanCollection) {
            if (!RLG_IsEmpty(meanModel.senCollection)) {
                [senArr addObjectsFromArray:meanModel.senCollection];
            }
        }
    }
    return senArr;
}
@end
