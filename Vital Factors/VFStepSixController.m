//
//  VFStepSixController.m
//  vital factors
//
//  Created by Michael Reiland on 12/30/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import "VFStepSixController.h"

@interface VFStepSixController ()

@end

@implementation VFStepSixController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    agreement1 = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://myvitalfactors.com/wireagreement1.html"] encoding:NSStringEncodingConversionAllowLossy error:nil];
    
    agreement2 = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://myvitalfactors.com/wireagreement2.html"] encoding:NSStringEncodingConversionAllowLossy error:nil];
    
    agreement1 = [agreement1 stringByReplacingOccurrencesOfString:@"##Agent ID##" withString:[allData objectAtIndex:0]];
    agreement1 = [agreement1 stringByReplacingOccurrencesOfString:@"##DBA Name##" withString:[allData objectAtIndex:1]];
    agreement1 = [agreement1 stringByReplacingOccurrencesOfString:@"##Business Owner##" withString:[allData objectAtIndex:2]];
    agreement1 = [agreement1 stringByReplacingOccurrencesOfString:@"##Dual Agent ID##" withString:[allData objectAtIndex:3]];
    agreement1 = [agreement1 stringByReplacingOccurrencesOfString:@"##Street Address##" withString:[allData objectAtIndex:4]];
    agreement1 = [agreement1 stringByReplacingOccurrencesOfString:@"##City##" withString:[allData objectAtIndex:5]];
    agreement1 = [agreement1 stringByReplacingOccurrencesOfString:@"##State##" withString:[allData objectAtIndex:6]];
    agreement1 = [agreement1 stringByReplacingOccurrencesOfString:@"##Zip##" withString:[allData objectAtIndex:7]];
    agreement1 = [agreement1 stringByReplacingOccurrencesOfString:@"##Brand##" withString:[allData objectAtIndex:8]];
    
    final1 = [self stringWithHTML:agreement1];
    final2 = [self stringWithHTML:agreement2];
    
    document1 = [self createPDF:@"FinalAgreement1.pdf" withText:final1];
    document2 = [self createPDF:@"FinalAgreement2.pdf" withText:final2];
    
    isComplete = TRUE;
    isView1 = FALSE;
    isView2 = FALSE;
    
}

- (NSAttributedString*)stringWithHTML:(NSString*)s {
    
    NSData* sData = [[NSData alloc] initWithBytes:[s UTF8String] length:s.length];
    NSDictionary* attrs = @{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute : @(NSUTF8StringEncoding)};
    NSError* err;
    NSAttributedString* aString = [[NSAttributedString alloc] initWithData:sData options:attrs documentAttributes:nil error:&err];
    
    return aString;
    
}

- (NSString *)createPDF:(NSString *)documentName withText:(NSAttributedString *)theString {
    
    //Get Document Directory path
    NSArray * dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    //Define path for PDF file
    NSString * documentPath = [[dirPath objectAtIndex:0] stringByAppendingPathComponent:documentName];
    
    // Prepare the text using a Core Text Framesetter.
    CFAttributedStringRef currentText = CFAttributedStringCreate(NULL, (__bridge CFStringRef)theString.string, NULL);
    
    if (currentText) {
        
        CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)(theString));
        if (framesetter) {
            
            
            // Create the PDF context using the default page size of 612 x 792.
            UIGraphicsBeginPDFContextToFile(documentPath, CGRectZero, nil);
            
            CFRange currentRange = CFRangeMake(0, 0);
            NSInteger currentPage = 0;
            BOOL done = NO;
            
            do {
                // Mark the beginning of a new page.
                UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
                
                // Draw a page number at the bottom of each page.
                currentPage++;
                [self drawPageNbr:(int)currentPage];
                
                // Render the current page and update the current range to
                // point to the beginning of the next page.
                currentRange = *[self updatePDFPage:(int)currentPage setTextRange:&currentRange setFramesetter:&framesetter];
                
                // If we're at the end of the text, exit the loop.
                if (currentRange.location == CFAttributedStringGetLength((CFAttributedStringRef)currentText))
                    done = YES;
            } while (!done);
            
            // Close the PDF context and write the contents out.
            UIGraphicsEndPDFContext();
            
            // Release the framewetter.
            CFRelease(framesetter);
            
        } else {
            NSLog(@"Could not create the framesetter..");
        }
        // Release the attributed string.
        CFRelease(currentText);
    } else {
        NSLog(@"currentText could not be created");
    }
    
    return documentPath;
    
}

-(CFRange*)updatePDFPage:(int)pageNumber setTextRange:(CFRange*)pageRange setFramesetter:(CTFramesetterRef*)framesetter{
    // Get the graphics context.
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    // Put the text matrix into a known state. This ensures
    // that no old scaling factors are left in place.
    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
    // Create a path object to enclose the text. Use 72 point
    // margins all around the text.
    CGRect frameRect = CGRectMake(72, 72, 468, 648);
    CGMutablePathRef framePath = CGPathCreateMutable();
    CGPathAddRect(framePath, NULL, frameRect);
    // Get the frame that will do the rendering.
    // The currentRange variable specifies only the starting point. The framesetter
    // lays out as much text as will fit into the frame.
    CTFrameRef frameRef = CTFramesetterCreateFrame(*framesetter, *pageRange,
                                                   framePath, NULL);
    CGPathRelease(framePath);
    // Core Text draws from the bottom-left corner up, so flip
    // the current transform prior to drawing.
    CGContextTranslateCTM(currentContext, 0, 792);
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    // Draw the frame.
    CTFrameDraw(frameRef, currentContext);
    // Update the current range based on what was drawn.
    *pageRange = CTFrameGetVisibleStringRange(frameRef);
    pageRange->location += pageRange->length;
    pageRange->length = 0;
    CFRelease(frameRef);
    return pageRange;
}

-(void)drawPageNbr:(int)pageNumber{
    NSString *setPageNum = [NSString stringWithFormat:@"Page %d", pageNumber];
    UIFont *pageNbrFont = [UIFont systemFontOfSize:14];
    
    CGSize maxSize = CGSizeMake(612, 72);
    CGSize pageStringSize = [setPageNum sizeWithFont:pageNbrFont
                                   constrainedToSize:maxSize
                                       lineBreakMode:NSLineBreakByClipping];
    
    CGRect stringRect = CGRectMake(((612.0 - pageStringSize.width) / 2.0),
                                   720.0 + ((72.0 - pageStringSize.height) / 2.0),
                                   pageStringSize.width,
                                   pageStringSize.height);
    [setPageNum drawInRect:stringRect withFont:pageNbrFont];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)compileData:(NSArray *)theData {
    
    allData = [NSArray arrayWithArray:theData];
    
}

- (IBAction)goHome:(UIButton *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:TRUE];
    
}

- (IBAction)showDocument:(UIButton *)sender {
    
    if (sender.tag == 101) {
        
        if ((isView1) || (isView2)) {
            
            if (isView1) {
                
                isView1 = FALSE;
                isView2 = FALSE;
                
                theView.hidden = TRUE;
                
                [viewButton1 setTitle:@"Show Agreement Part 1" forState:UIControlStateNormal];
                [viewButton2 setTitle:@"Show Agreement Part 2" forState:UIControlStateNormal];
                
            } else {
                
                isView1 = TRUE;
                isView2 = FALSE;
                
                [theView loadHTMLString:agreement1 baseURL:nil];
                
                theView.hidden = FALSE;
                
                [viewButton1 setTitle:@"Hide Agreement" forState:UIControlStateNormal];
                
            }
            
        } else {
            
            isView1 = TRUE;
            
            [theView loadHTMLString:agreement1 baseURL:nil];
            
            theView.hidden = FALSE;
            
            [viewButton1 setTitle:@"Hide Agreement" forState:UIControlStateNormal];
            
        }
        
    } else {
        
        if ((isView1) || (isView2)) {
            
            if (isView2) {
                
                isView1 = FALSE;
                isView2 = FALSE;
                
                theView.hidden = TRUE;
                
                [viewButton1 setTitle:@"Show Agreement Part 1" forState:UIControlStateNormal];
                [viewButton2 setTitle:@"Show Agreement Part 2" forState:UIControlStateNormal];
                
            } else {
                
                isView2 = TRUE;
                isView1 = FALSE;
                
                [theView loadHTMLString:agreement2 baseURL:nil];
                
                theView.hidden = FALSE;
                
                [viewButton1 setTitle:@"Hide Agreement" forState:UIControlStateNormal];
                [viewButton2 setTitle:@"Show Agreement Part 2" forState:UIControlStateNormal];
                
            }
            
        } else {
            
            isView2 = TRUE;
            
            [theView loadHTMLString:agreement2 baseURL:nil];
            
            theView.hidden = FALSE;
            
            [viewButton1 setTitle:@"Show Agreement Part 1" forState:UIControlStateNormal];
            [viewButton2 setTitle:@"Hide Agreement" forState:UIControlStateNormal];
            
        }
        
    }
    
}

- (IBAction)shareAgreement:(UIBarButtonItem *)sender {
    
    NSString *textToShare = @"Here is the Wire Agreement.";
    NSURL *myWebsite = [NSURL URLWithString:@"http://www.myvitalfactors.com/"];
    
    NSString *str1 = document1;
    NSString *str2 = document2;
    
    NSArray *objectsToShare = @[textToShare, [NSURL fileURLWithPath:str1], [NSURL fileURLWithPath:str2], myWebsite];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    NSArray *excludeActivities = @[UIActivityTypeAddToReadingList,
                                   UIActivityTypeAssignToContact,
                                   UIActivityTypeCopyToPasteboard,
                                   UIActivityTypePostToTencentWeibo,
                                   ];
    
    activityVC.excludedActivityTypes = excludeActivities;
    
    
    
    [self presentViewController:activityVC animated:YES completion:nil];
    
}

@end
