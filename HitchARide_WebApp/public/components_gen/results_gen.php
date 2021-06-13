<?php
    if (
    isset($_GET["from"], $_GET["to"], $_GET["date"], $_GET["nPassegners"])
    ) {
        $database = new Database();
        $db = $database->connect();
        $query = 'SELECT 
        trip.id,
        trip.departure_date,
        trip.departure_time,
        trip.duration,
        trip.max_passengers,
        trip.price,
        trip.driver_id,
        city.name,
        destination_city.name,
        FROM trip
        INNER JOIN city ON trip.id_origin = city.id
        INNER JOIN city AS destination_city ON trip.id_destination = destination_city.id
        WHERE city.name = ' . $_GET["from"] . ' AND destination_city.name = ' . $_GET["to"] . //I viaggi che partono e arrivano alle città specificate
        ' AND trip.departure_date = '. $_GET["date"] . //Il giorno specificato
        ' ORDER BY trip.price ASC'; 

        $stmt = $db->prepare($query);
        $stmt->execute();

        if ($stmt->rowCount() > 0) { //Controllare se ci sono viaggi corrispondenti
                       
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

                /*
                Fare la query che per ogni viaggio prende le informazioni dell'autista
                e fa la media dei voti.
                */
                           
                $driver_query = 'SELECT 
                driver.name,
                driver.photo,
                AVG(comment.rating) AS "rating", /* Media dei voti assegnati al guidatore */
                FROM driver
                INNER JOIN comment ON driver.id = comment.driver_id
                WHERE driver.id = ' . $row['driver_id'] . ' AND comment.author = "passenger" '.
                GROUP BY driver.id; /* Raggruppamento per guidatore, per poter usare la funzione associativa */

                $driver_stmt = $db->prepare($driver_query);
                $driver_stmt->execute();

                $driver_row = $driver_stmt->fetch(PDO::FETCH_ASSOC)

                /*
                Generazione del componente HTML che rappresenta il viaggio con i dati:            
                */    
            }
            } else {
                /* echo('Non sono stati trovati viaggi che soddisfino le tue richieste') */
            }        
        } else {
            /* Echo 'I viaggi che soddisfano i tuoi requisiti appariranno qui...' */
        }
?>