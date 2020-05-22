<?php include("db.php"); ?>
<?php include("check.php"); ?>
<!DOCTYPE html>
<html lang="en">
    <?php include("head.php"); ?>
<body>

    <?php include("nav.php"); ?>

    <header id="header" class="container mb-5">
        <div id="advertisement_carousel" class="carousel slide" data-ride="carousel">
            <?php
            $sql = "SELECT * FROM reclame";
            $result = $conn->query($sql);
            if ($result->num_rows > 0) {
                echo '<ol class="carousel-indicators">';
                for ($i=0; $i < $result->num_rows; $i++) {
                    if ($i == 0) {
                        echo '<li data-target="#advertisement_carousel" data-slide-to="'.$i.'" class="active"></li>';
                    } else {
                        echo '<li data-target="#advertisement_carousel" data-slide-to="'.$i.'"></li>';
                    }
                }
                echo '</ol>';
                $first = true;
                echo '<div class="carousel-inner">';
                while ($row = $result->fetch_assoc()) {
                    if ($first) {
                        echo '<div class="carousel-item active">
                                <img src="'.$row['image'].'" alt="ad" class="d-block w-100">
                            </div>';
                        $first = false;
                    } else {
                        echo '<div class="carousel-item">
                                <img src="'.$row['image'].'" alt="ad" class="d-block w-100">
                            </div>';
                    }
                }
                echo '</div>';
            }
            ?>
        </div>
    </header>

    <section class="container mb-4">
        <div class="row no-gutters">
            <div class="col-lg-12">
                <form action="search.php">
                    <div class="form-group">
                        <input type="search" name="q" class="form-control text-truncate rounded-0" placeholder="Найти по названию ...">
                    </div>
                </form>
            </div>
        </div>
    </section>

    <main class="container">
        <h3>Новые</h3>
        <br>
        <div class="row row-cols-2 row-cols-sm-3 row-cols-md-3 row-cols-lg-4 row-cols-xl-4">
            <?php
            $sql = "SELECT * FROM bag ORDER BY date LIMIT 4";
            $result = $conn->query($sql);
            $latest_bags = $result->fetch_all(MYSQLI_ASSOC);
            ?>
            <?php foreach ($latest_bags as $bag) : ?>
                <div class="col mb-4">
                    <div class="card rounded-0 border-0">
                        <img src="<?= $bag['image'] ?>" alt="Bag image" class="card-img-top rounded-0">
                        <div class="card-body px-0 pt-1">
                            <a href="bag.php?id=<?= $bag['id'] ?>">
                                <p class="card-text text-justify text"><?= $bag['title'] ?></p>
                            </a>
                            <h6 class="card-title pt-1">
                                <?= get_price($bag['id']) ?>
                                <span class="float-right"><i class="fa <?= check_for_like($bag['id']) ? 'fa-heart' : 'fa-heart-o' ?>" id="like_<?= $bag['id'] ?>" onclick="like(<?= $bag['id'] ?>)"></i></span>
                            </h6>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
        <h3>Популярные</h3>
        <br>
        <div class="row row-cols-2 row-cols-sm-3 row-cols-md-3 row-cols-lg-4 row-cols-xl-4">
            <?php
            //should be modified
            $sql = "SELECT * FROM bag ORDER BY date desc LIMIT 4";
            $result = $conn->query($sql);
            $popular_bags = $result->fetch_all(MYSQLI_ASSOC);
            ?>
            <?php foreach ($popular_bags as $bag) : ?>
                <div class="col mb-4">
                    <div class="card rounded-0 border-0">
                        <img src="<?= $bag['image'] ?>" alt="Bag image" class="card-img-top rounded-0">
                        <div class="card-body px-0 pt-1">
                            <a href="bag.php?id=<?= $bag['id'] ?>">
                                <p class="card-text text-justify text"><?= $bag['title'] ?></p>
                            </a>
                            <h6 class="card-title pt-1">
                                <?= get_price($bag['id']) ?>
                                <span class="float-right"><i class="fa <?= check_for_like($bag['id']) ? 'fa-heart' : 'fa-heart-o' ?>" id="like_<?= $bag['id'] ?>" onclick="like(<?= $bag['id'] ?>)"></i></span>
                            </h6>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </main>

    <!-- footer -->
    <footer class="container footer mt-auto py-3">
        <span class="text-muted">© April Bags Inc. - Bishkek, 2019</span>
    </footer>

    <!-- bootstrap -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <!-- own script -->
    <script src="js/script.js" charset="utf-8"></script>
</body>
</html>
