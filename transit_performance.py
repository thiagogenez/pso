#!/usr/bin/env python


###############################################################################
## IMPORT                                                                    ##
###############################################################################
from __future__                  import with_statement;

from math import sqrt

import sys;
import pyswarm as ps; 
import time;
import json;
import operator;
import pprint;
import random;
import numpy as np






###############################################################################
## DEFINITION                                                                ##
###############################################################################
## RANGE OF VALUES:
II=0;
IF=100;

FI=0.0;
FF=100.0;


## PRIORITIES:
WE = 1.0
WD = 0.9
WP = 0.1

FILE_CONFIG = False;
FILE="cases/simulations.txt"

MAX_LOOP = 10

TYPE="order"






###############################################################################
## FUNCTIONS                                                                 ##
###############################################################################
def mean_and_stddev(iteraction, sample, values):

    resultVal = [];
    standvVal = [];

    ## Calculate 
    for i in range(0, iteraction):

        valuesList = [];
        for j in range(0, sample):
            valuesList.append(values[j][i]);

        ## Calculate the mean:
        variance = 0;
        mean = round(sum(valuesList)/float(len(valuesList)),4);
        for e in valuesList:
            variance += (e-mean)**2;

        variance /= len(valuesList);

        stddev = sqrt(variance);

        ##
        resultVal.append(round(mean  ,4));
        standvVal.append(round(stddev,4));

    return resultVal, standvVal;





###############################################################################
## CLASSES                                                                   ##
###############################################################################
class Main:


    """
    ---------------------------------------------------------------------------
    """


    ###########################################################################
    ## ATTRIBUTES                                                            ##
    ###########################################################################
    __considerDivision = None;

    __pList = {};
    __dList = {};
    __eList = {};
    __bList = {};
    __rList = [];

    __attributesInt   = None;
    __attributesFloat = None;

    __sizeOfDivision = 0;

    __nAI = 0;
    __nAF = 0;


    ###########################################################################
    ## SPECIAL METHODS                                                       ##
    ###########################################################################
    def __init__(self, idx, nP, nD, nE, nAI, nAF, sizeOfSlot, considerDivision, wE, wD, wP):
       ##
       self.__sizeOfSlot = sizeOfSlot;

       self.__idx = str(idx);

       self.__nAI = nAI;
       self.__nAF = nAF;

       ## Consider or not the player residents in division:
       self.__considerDivision = considerDivision;

       playerIdx  = 0;

       self.__eList, playerIdx = self.__populate_list(nE,nAI,nAF,playerIdx,wE);
       self.__dList, playerIdx = self.__populate_list(nD,nAI,nAF,playerIdx,wD);
       self.__pList, playerIdx = self.__populate_list(nP,nAI,nAF,playerIdx,wP);

       ## Base list:
       self.__bList, playerIdx = self.__populate_list(0,0,nAF,0,0.0);


    ###########################################################################
    ## PUBLIC METHODS                                                        ##
    ###########################################################################
    ##
    ## BRIEF:
    ## -----------------------------------------------------------------------
    ##
    def __populate_list(self, nList, nAI, nAF, idx, weight):

         ## Create player list with the player residents inside the division:
         tupleList = [];
         indexList = [('id','S10'), ('w',float)];

         for j in range(0, nAF):
             indexList.append((str(j), float));

         for k in range(0, nList):
              playerPerfil = ['player' + str(idx), weight];

              for j in range(0, nAF):
                  playerPerfil.append(round(random.uniform(FI,FF), 4));

              tupleList.append(tuple(playerPerfil));
              idx += 1;

         ## Create np array:
         playerList = np.array(tupleList, dtype=indexList);      
         
         return playerList, idx;


    ##
    ## BRIEF:
    ## -----------------------------------------------------------------------
    ##
    def run(self):

       iniTime1 = time.time();
       lE1, lD1, lP1, lO1 = self.__aloccated_with_division_players();
       endTime1 = time.time();

       iniTime2 = time.time();
       lE2, lD2, lP2, lO2 = self.__aloccated_wout_division_players();
       endTime2 = time.time();

       val1 = round(endTime1 - iniTime1,4);
       val2 = round(endTime2 - iniTime2,4);

       strRetVal  = str(self.__idx)+ ";";
       strRetVal += str(val1)      + ";";
       strRetVal += str(val2);

       return val1,val2


    ###########################################################################
    ## PRIVATE METHODS                                                       ##
    ###########################################################################
    ##
    ## ------------------------------------------------------------------------
    ##
    def __analazy(self, lE, lD, lP, lO):

        tmpListS = [];
        tmpListR = [];

        for player in lE:
            tmpListS.append(player[2]);
            tmpListR.append(player[3]);

        sMin = min(tmpListS);
        rMin = min(tmpListR);

        hitAloneDS = 0;
        hitAloneDR = 0;

        hitAlonePS = 0;
        hitAlonePR = 0;

        hitSetD = 0;
        hitSetP = 0;


        ## Check if exist any player in out of division list with good values.
        for player in lD:
            ## -----
            if float(player[2]) > float(sMin):
                hitAloneDS += 1; 

            if float(player[3]) > float(rMin):
                hitAloneDR += 1; 

            ## -----
            if (float(player[2]) > sMin) and (float(player[3]) > rMin):
                hitSetD += 1; 

        ##
        for player in lP:
            ## ----
            if float(player[2]) > sMin:
                hitAlonePS += 1; 

            if float(player[3]) > rMin:
                hitAlonePR += 1; 

            ## -----
            if (float(player[2]) > sMin) and (float(player[3]) > rMin):
                hitSetP += 1; 

        return hitAloneDS, hitAloneDR, hitAlonePS, hitAlonePR, hitSetD, hitSetP;


    ##
    ## BRIEF: calculate the mean only of score and resources.
    ## ------------------------------------------------------------------------
    ## @PARAM listOfPlayers == list with all players to handle.
    ##
    def __calc_mean_score_resource(self, listOfPlayers):

        listS = [];
        listR = [];

        for element in listOfPlayers:
            listS.append(element[2]); 
            listR.append(element[3]);

        try:
            maxSValue = max(listS);
            maxRValue = max(listR);

            minSValue = min(listS);
            minRValue = min(listR);
        except:
            maxSValue = 0.0;
            minSValue = 0.0;

            maxRValue = 0.0;
            minRValue = 0.0;

        ## Size of player's list:
        length = len(listOfPlayers); 

        ##
        if length != 0:
            meanS = np.mean(listS);
            meanR = np.mean(listR);
        else:
            meanS = 0.0;
            meanR = 0.0;

        return length, round(meanR,4), round(meanS,4), maxSValue, minSValue, maxRValue, minRValue;


    ##
    ## BRIEF: allocate the player in division (consider players in division).
    ## ------------------------------------------------------------------------
    ##
    def __aloccated_with_division_players(self): 

        lenghtE = self.__eList.shape[0];
        lenghtD = self.__dList.shape[0];
        lenghtP = self.__pList.shape[0];

        eTmpList = [];
        dTmpList = [];
        pTmpList = [];
        oTmpList = [];

        ## Calculate the size o the division slots (consider the elements pre-
        ## sents in the division).        
        allSize = lenghtE + self.__sizeOfSlot;

        if   TYPE == "order":
            ##  Concatane the all lists and ordering the players.
            tList = self.__ordering_players_candidate(
                                   np.concatenate((self.__eList,
                                                   self.__dList, self.__pList)));
        elif TYPE == "pso":
            tList = self.__pso_players_candidate(
                                   np.concatenate((self.__eList,
                                                   self.__dList, self.__pList)));

        idx = 0;
        for i in range(0, tList.shape[0]):

            if idx < allSize:
                eTmpList.append(tList[i]);
            else:
                ##
                if   tList[i] in self.__dList:
                    dTmpList.append(tList[i]);

                ##
                elif tList[i] in self.__pList:
                    pTmpList.append(tList[i]);

                ## 
                else:
                    oTmpList.append(tList[i]);

            idx += 1;

        return eTmpList, dTmpList, pTmpList, oTmpList;


    ##
    ## BRIEF: allocate the player in division.
    ## ------------------------------------------------------------------------
    ##
    def __aloccated_wout_division_players(self): 

       lenghtE = self.__eList.shape[0];
       lenghtD = self.__dList.shape[0];
       lenghtP = self.__pList.shape[0];

       eTmpList = [];
       dTmpList = [];
       pTmpList = [];
       oTmpList = [];


       ## Check size of the slots avaliable in the division:
       if (lenghtD + lenghtP) > self.__sizeOfSlot: 

           if   TYPE == "order":
               ## Cat two array and ordering;
               tList = self.__ordering_players_candidate(
                                 np.concatenate((self.__dList, self.__pList)));
           elif TYPE == "pso":
               tList = self.__pso_players_candidate(
                                 np.concatenate((self.__dList, self.__pList)));

           idx = 0;
           for i in range(0, tList.shape[0]):
               if idx < self.__sizeOfSlot:
                  eTmpList.append(tList[i]);
               else:
                  ##
                  if   tList[i] in self.__dList:
                     dTmpList.append(tList[i]);
                  ##
                  elif tList[i] in self.__pList:
                     pTmpList.append(tList[i]);
                  ## 
                  else:
                      oTmpList.append(tList[i]);

               idx += 1;

       else:
           ## Concatane all players:
           tList = np.concatenate((self.__eList, self.__dList, self.__pList));
           for i in range(0, tList.shape[0]):
               eTmpList.append(tList[i]);

       return eTmpList, dTmpList, pTmpList, oTmpList;
      

    ##
    ## BRIEF: use sequential approach.
    ## ------------------------------------------------------------------------
    ## @PARAM listToOrdering == list to ordering.
    ##
    def __ordering_players_candidate(self, listToOrdering):

        idxOrder = ['w'];
        for idx in range(0, self.__nAF):
            idxOrder.append(str(idx));

        ## 
        listToOrdering[::-1].sort(order=idxOrder);

        return listToOrdering;


    ##
    ## BRIEF: use PSO approach.
    ## ------------------------------------------------------------------------
    ## @PARAM listToOrdering == list to ordering.
    ##
    ##
    def __ordering_players_candidate(self, listToOrdering):
        return listToOrdering;
## END CLASS.








###############################################################################
## MAIN                                                                      ##
###############################################################################
if __name__ == "__main__":

    ##
    ## Test Cases:
    ## 1 -  
    ## 2 -  
    ## 3 -  
    ## 4 -  
    ## 5 -  
    ## 6 -  
    ##
    try:
        with open(FILE) as fp:
            config = json.load(fp);
    except:
        sys.exit(0);

    values1 = [];
    values2 = [];

    for j in range(0, MAX_LOOP):
        iteractionVal1 = [];
        iteractionVal2 = [];

        for i in range(1,101):

            nP  = i;
            nD  = i;
            nE  = i;

            nAI = 0;
            nAF = i;

            wD  = 0.0;
            wE  = 0.0;
            wP  = 0.0;

            sizeOfSlots= 10;
            wDivisions = False;

            main = Main(i, nP, nD, nE, nAI, nAF, sizeOfSlots, wDivisions, wE, wD, wP);
            val1, val2 = main.run();

            iteractionVal1.append(val1);
            iteractionVal2.append(val2);

        ## 
        values1.append(iteractionVal1);
        values2.append(iteractionVal2);

    resultVal1, standvVal1 = mean_and_stddev(100, MAX_LOOP, values1);
    resultVal2, standvVal2 = mean_and_stddev(100, MAX_LOOP, values2);

    for i in range(0, 100):
        print str(i+1) + ";" + str(resultVal1[i])+";"+str(standvVal1[i])+";"+str(resultVal2[i])+";"+str(standvVal2[i]);

## EOF.
