/* $NetBSD: global.js,v 1.1 2009/03/02 16:10:39 mishka Exp $ */
/* Based on english version: */
/* NetBSD: global.js,v 1.1 2009/03/02 16:10:39 mishka Exp   */

/*
 * Copyright (c) 2009 The NetBSD Foundation, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
 * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

/*
 * NULL = readJS(url)
 *	append JavaScript code referenced by url into <head>
 */
function readJS(url) {
	var script = document.createElement('script');
	script.setAttribute('type', 'text/javascript')
	script.setAttribute('src', url);
	document.getElementsByTagName('head').item(0).appendChild(script);
}

/*
 * bool = validateAmount(amount)
 *	validate donation amount, for Google Checkout
 */
function validateAmount(amount){
	if(amount.value.match( /^[0-9]+(\.([0-9]+))?$/)){
		return true;
	}else{
		alert('金額を正しい形式で入力してください。');
		amount.focus();
		return false;
	}
}
