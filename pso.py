#!/usr/bin/env python








###############################################################################
## IMPORT                                                                    ##
###############################################################################
from __future__                  import with_statement;

import sys;
import pyswarm as ps; 
import time;

from multiprocessing             import Process, Queue, Lock;






###############################################################################
## DEFINITION                                                                ##
###############################################################################
ALL_PLAYERS={
'player01':{'score':0.1, 'resources':10, 'enables':[True,False,False]},
'player02':{'score':0.1, 'resources':10, 'enables':[True,False,False]},
'player03':{'score':0.1, 'resources':10, 'enables':[True,False,False]},
'player04':{'score':0.1, 'resources':10, 'enables':[True,False,False]},
'player05':{'score':0.1, 'resources':10, 'enables':[True,False,False]},
'player06':{'score':0.1, 'resources':10, 'enables':[True,False,False]},
'player07':{'score':0.1, 'resources':10, 'enables':[True,False,False]},
'player08':{'score':0.1, 'resources':10, 'enables':[True,False,False]},
'player09':{'score':0.1, 'resources':10, 'enables':[True,False,False]},
}

NUM_DIVISIONS=3

FEATURES = ['score','resources'];
ROUNDS   = [1.0, 1.1, 1.2];








###############################################################################
## CLASSES                                                                   ##
###############################################################################
class Manager(Process):
    """
    ---------------------------------------------------------------------------
    """

    ###########################################################################
    ## ATTRIBUTES                                                            ##
    ###########################################################################
    __queue = None;

    
    ###########################################################################
    ## SPECIAL METHODS                                                       ##
    ###########################################################################
    def __init__(self, queue):
        super(Manager, self).__init__();

        self.__queue = queue;


    ###########################################################################
    ## PUBLIC METHODS                                                        ##
    ###########################################################################
    ##
    ## BRIEF:
    ## ------------------------------------------------------------------------
    ##
    def run(self):
        global ALL_PLAYERS;

        while True:
            particles = self.__queue.get();

            print particles['id'];
            print particles['fitnessValues'];


        

    ###########################################################################
    ## PRIVATE METHODS                                                       ##
    ###########################################################################
    ##
    ## BRIEF:
    ## ------------------------------------------------------------------------
    ##
    def handle(self):
        pass;
## END CLASS.







 
class Pso(Process):

    """
    ---------------------------------------------------------------------------
    1 - cada divisao eh um PSO (PSO x numero de divisoes)
    2 - uma particula eh um conjunto de jogador
    3 - cada particula eh uma solucao paa divisao

    PARTICULA = [Jogador1, Jogador2, ..., JogadorN]
    ENXAME    = [Particula1, Particua2, ...

    **
    4 - Todos os jogadores estaram em todas os enxames, porem aqueles que nao
        estiverem na respectiva divisao serao desativados.
    
    5 - 




    """


    ###########################################################################
    ## ATTRIBUTES                                                            ##
    ###########################################################################
    __particles = None;
    __features  = None;
    __psoNumber = None;
    __locks     = None;
    __queue     = None;
    __roundTime = None;


    ###########################################################################
    ## SPECIAL METHODS                                                       ##
    ###########################################################################
    def __init__(self, allPlayers, features, psoNumber, locks, queue, roundTime):
        super(Pso, self).__init__();

        self.__locks = locks;
        self.__queue = queue;

        ## Set round time:
        self.__roundTime = roundTime;

        ## Number of particles is the size of J set:
        self.__particles = len(ALL_PLAYERS);

        ##
        self.__features = features;

        ## Get PSO number (meaning the division number):
        self.__psoNumber = psoNumber;


    ###########################################################################
    ## PUBLIC METHODS                                                        ##
    ###########################################################################
    def run(self):

        while True:
            allPlayer = self.__get_players();

            with self.__locks[0]:
                fitnessValues = self.__fitness(allPlayers);

            ## TODO: To do anything PSO:
            ## TODO: how associate?
            
            ## Send to management:
            with self.__locks[1]:
                values = {
                    'fitnessValues': fitnessValues,
                    'id'           : self.__psoNumber
                };

                self.__queue.put(values);

            time.sleep(self.__roundTime);
            
        return 0;


    ###########################################################################
    ## PRIVATE METHODS                                                       ##
    ###########################################################################
    ##
    ## BRIEF: recebe uma particula como entrada e retorna um numero real (valor
    ##         fitness). O valor fitness representara os atributos do problemas,
    ##         os quais vao ser maximizados pelo PSO.Essa funcao precisa ser de
    ##         finida (envolvendo os historicos, scores, etc)
    ## ------------------------------------------------------------------------
    ## 
    def __fitness(self, particles):
        fitnessValues = [];

        for player in particles.keys():

            ## Calculate individual value:
            individualFitnessValue = self.__per_player(particles[player]);

            ## Store the value;
            fitnessValues.append(individualFitnessValue);

        return fitnessValues;


    ##
    ## BRIEF: calculate a value real to player:
    ## ------------------------------------------------------------------------
    ## @PARAM player == player to calculate the value.
    ##
    def __per_player(self, player):
        fitnessValue = 0.0;

        ## Check if the player is enable to this PSO.
        if player['enables'][self.__psoNumber] == True:
            fitnessValue = self.__function_G(player);

        return fitnessValue;


    ##
    ## BRIEF: function G.
    ## ------------------------------------------------------------------------
    ## @PARAM player == player to calculate the value.
    ##
    def __function_G(self, player):
        ## TODO: validate!!!!!
        return player['score'] + player['resources'];


    ##
    ##
    ##
    def __get_players(self):
        global ALL_PLAYERS;
        return ALL_PLAYERS;
## END CLASS.








class Main:


    """
    ---------------------------------------------------------------------------
    """


    ###########################################################################
    ## ATTRIBUTES                                                            ##
    ###########################################################################
    __threadsId  = [];
    __psoNumber  = None;
    __allPlayers = None;
    __allFeatures= None;
    __running    = True;
    __roundTimes = None;
    __locks      = None;
    __queue      = None;


    ###########################################################################
    ## SPECIAL METHODS                                                       ##
    ###########################################################################
    def __init__(self, divisions, allPlayers, allFeatures, roundTimes):

        ## Set divisions:
        self.__psoNumber = divisions;

        ## Set the players and the features to explore.
        self.__allPlayers  = allPlayers;
        self.__allFeatures = allFeatures;

        ##
        self.__roundTimes = roundTimes;

        self.__locks = [Lock(),Lock()];
        self.__queue = Queue();


    ###########################################################################
    ## PUBLIC METHODS                                                        ##
    ###########################################################################
    def run(self):

        ## Create all threads.The number of threads are defineds in the cfgFile.
        for psoNumber in range(0, self.__psoNumber):
            newPso = Pso(self.__allPlayers , 
                         self.__allFeatures,
                         psoNumber, 
                         self.__locks, 
                         self.__queue, self.__roundTimes[psoNumber]);

            newPso.daemon = True;
            newPso.start();

            ## Store the thread:
            self.__threadsId.append(newPso);

        ## Start the manager:
        manager = Manager(self.__queue);
        manager.daemob = True;
        manager.start();

        self.__threadsId.append(manager);

        ## Waiting for finish:
        self.__waiting_finish();

        return 0;


    ##
    ## BRIEF:
    ## ------------------------------------------------------------------------
    ##
    def stop(self):
        self.__running = False;
        return 0;


    ###########################################################################
    ## PRIVATE METHODS                                                       ##
    ###########################################################################
    ##
    ## BRIEF: wait threads finish.
    ## ------------------------------------------------------------------------
    ##
    def __waiting_finish(self):

        while self.__running == True:
            ## Wait 5 minutes:
            time.sleep(300);

        for thread in self.__threadsId:
            thread.join();

        return 0;



## END CLASS.








###############################################################################
## MAIN                                                                      ##
###############################################################################
if __name__ == "__main__":

    try:
        main = Main(NUM_DIVISIONS, ALL_PLAYERS, FEATURES, ROUNDS);
        main.run();

    except ValueError as exceptionNotice:
        print exceptionNotice;

    except KeyboardInterrupt:
        main.stop();
        print "BYE!";

    sys.exit(0);

## EOF.
