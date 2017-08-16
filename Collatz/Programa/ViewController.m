//
//  ViewController.m
//  Programa
//
//  Created by Luis Teodoro on 28/07/17.
//  Copyright © 2017 Luis Teodoro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    
    NSMutableDictionary * cacheCollatz;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];

    long long  largerSequence = 0;
    long long numberSequences = 0;
    long long inputStart = 1000000;
    
    
    cacheCollatz = [[NSMutableDictionary alloc]init];
    
    for ( long long i = 1; i < inputStart ; i++ ) {
        long long sequence = [self calculateSequences:i];
        if( sequence > numberSequences ) {
            numberSequences = sequence;
            largerSequence = i;
        }
    }
    
    NSLog(@"Item with greater sequence: %lld",largerSequence);
    NSLog(@"Number of sequences:  %lld",numberSequences);
}

-(long long)calculateSequences:(long long)input{
    
    long long inputStart = input;
    long long conut = 0;
    
    while (inputStart > 1) {
        
        if (cacheCollatz[[NSString stringWithFormat:@"%lld",inputStart]] != nil) {
            conut = conut + [cacheCollatz[[NSString stringWithFormat:@"%lld",inputStart]]  longLongValue];
            break;
        }
        
        inputStart= [self collatz:inputStart];
        conut++;
    }

    [cacheCollatz setObject:[NSString stringWithFormat:@"%lld",conut] forKey:[NSString stringWithFormat:@"%lld",input] ];
    
    return conut;
    
}


-(long long)collatz:(long long)input {
    if(input != 1) {
        if(input %2 == 0) {
            input = input / 2;
        } else {
            input = input * 3 + 1;
        }
    }
    return input;
}

@end
