//============================================================================
// Name        : test.cpp
// Author      : Hichem YOUSFI
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <stdio.h>
#include <unistd.h>
#include <assert.h>

#include "driver/common.h"
#include "driver/jtag_atlantic.h"

using namespace std;

static const char data_to_send[] = "Hello world\n";
static const int times_to_send = 20;
static char buf[16];

int main() {
	cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!

	JTAGATLANTIC *atlantic = jtagatlantic_open(NULL, -1, -1, "echohello");
	    if(!atlantic) {
	        show_err();
	        return 1;
	    }
	    show_info(atlantic);
	    fprintf(stderr, "Unplug the cable or press ^C to stop.\n");
	    for(int i = 0; i < times_to_send; i++) {
	        int ret = jtagatlantic_write(atlantic, data_to_send, sizeof(data_to_send));
	        assert(ret == sizeof(data_to_send));
	    }
	    jtagatlantic_flush(atlantic);
	    while(1) {
	        int ret = jtagatlantic_read(atlantic, buf, sizeof(buf));
	        if(ret < 0)
	            break;
	        fwrite(buf, ret, 1, stdout);
	        usleep(10000);
	    }
	    jtagatlantic_close(atlantic);

	cout << "!!!Goodbye World!!!" << endl; // prints !!!Goodbye World!!!

	getchar();

	return 0;
}
