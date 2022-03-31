
<center> <h1>Techniques de transmission et traitement du signal : </br> <center>Simulation d'une chaine de transmission</center> </h1> </center>
<h2> Simulation de l'emetteur</h2>
<h3> Génération des messages aléatoires</h3>
<p>La fonction d'un émetteur est d'envoyer un signal analogique capable de se propager correctement sur le canal physique, occupant la bande de fréquence souhaitée, et ayant le niveau de puissance souhaité, en fonction des bits d'information fournis à son entrée.</p>
<p>Le message à transmettre prend la forme d'une trame de M bits : xn(k) = 0/1 où k ∈ [0 · · M - 1]. Le débit est de R bits/s, c'est-à-dire que la durée de chaque bit est de Tb = 1R secondes.</p>
<p>Sur Matlab cette séquence est génerée de la manière suivant :</p>
<img src="ak_genrator.png" />
<p>La fonction rand genere un nombre aléatoire entre  0 et 1 . La fonction round donc arrondi ce nobmre soit a 0 soit a 1. </p>