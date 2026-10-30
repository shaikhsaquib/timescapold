/* 
 * Front Controller
 * @(#)TechAllowanceClaimWebController.java
 *
 * Copyright 2003 BCCL. All Rights Reserved.
 *
 * This software is the proprietary information of BCCL.
 * Use is subject to license terms.
 *
 */

package com.bccl.medCheckupExpensesClaim.web.controllerbeans;

import java.util.Hashtable;
import java.util.ArrayList;

import com.bccl.medCheckupExpensesClaim.controller.medCheckupClaimController;

public class medCheckupClaimWebController  {

	/*
	* Constructors
	*/

	medCheckupClaimController medCheckupControllerObj = new medCheckupClaimController();

	public medCheckupClaimWebController( ) {	
		
	}



	/*
		@Method Name 		: create()
		@Arguments			: Hashtable - hashDetails
		@Returns			: boolean - status
		@Comments			: Files a request for Technical Claim to be processed by Finance
	*/
	
	public boolean create(Hashtable hashDetails)
	{	
		
		return medCheckupControllerObj.create(hashDetails);
	}



	public String toString ()
	{

        return "";
    }

}