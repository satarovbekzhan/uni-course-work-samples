<!DOCTYPE html>
<html lang="en">
<head>
    <!-- head -->
    <?php include("head.php"); ?>
</head>
<body>

    <!-- navbar -->
    <?php include("nav.php"); ?>

    <!-- delivery -->
    <main class="container">
        <p class="text-justify">Мы находимся по адресу ниже:</p>
        <div class="map-container z-depth-1-half mb-5" id="map-container" style="height: 68vh"></div>
        <div class="row">
            <div class="col-lg-6">
                <p class="text-justify">Бесплатная доставка осуществляется в пределах красной отметки при заказе от 500 сом.
                     Вне города через курьерские службы.</p>
            </div>
            <div class="col-lg-6">
                <img class="img-fluid" src="http://bambook.kg/media/delivery/map.jpg" alt="map">
            </div>
        </div>
        <br>
        <br>
    </main>

    <!-- bootstrap -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <!-- google maps -->
    <script src="https://maps.google.com/maps/api/js"></script>
    <!-- own script -->
    <script src="js/script.js" charset="utf-8"></script>
</body>
</html>
