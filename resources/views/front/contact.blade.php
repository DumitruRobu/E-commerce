@extends("front.layouts.app")

@section("content")
<section class="section-5 pt-3 pb-3 mb-3 bg-white">
    <div class="container">
        <ol class="breadcrumb primary-color mb-0">
            <li class="breadcrumb-item"><a class="white-text" href="{{ route("front.home") }}">Home</a></li>
            <li class="breadcrumb-item">Contact Us</li>
        </ol>
    </div>
</section>

<section class="section-10 text-center">
    <div class="container">
        <div class="title">
            <h1>CONTACT US</h1>
        </div>
    </div>
</section>

<div class="container">
    <div class="card my-5">
        <div class="card-body">
            <p class="text-center">
                This website is a commercial Clothing Store Project made by Timotin Adrian <br> that represents the knowledge accumulated by him during 2 years <br> of studying the it domain at the Step It Academy from Moldova.
            </p>
            <h3 class="text-center">Developer: <strong>Timotin Adrian</strong></h3>
            <ul class="text-center">
                <li><h4><br>Phone: +373 62 099 020</h4></li>
                <li><h4>Email: adriantimotin25@gmail.com</h4></li>
            </ul>
        </div>
    </div>

    <!-- Your contact form can be uncommented here if needed -->
    {{-- 
    <div class="row">
        <div class="col-md-6">
            <form class="shake" role="form" method="post" id="contactForm" name="contact-form">
                <div class="mb-3">
                    <label class="mb-2" for="name">Name</label>
                    <input class="form-control" id="name" type="text" name="name" required data-error="Please enter your name">
                    <div class="help-block with-errors"></div>
                </div>
                
                <div class="mb-3">
                    <label class="mb-2" for="email">Email</label>
                    <input class="form-control" id="email" type="email" name="email" required data-error="Please enter your Email">
                    <div class="help-block with-errors"></div>
                </div>
                
                <div class="mb-3">
                    <label class="mb-2">Subject</label>
                    <input class="form-control" id="msg_subject" type="text" name="subject" required data-error="Please enter your message subject">
                    <div class="help-block with-errors"></div>
                </div>
                
                <div class="mb-3">
                    <label for="message" class="mb-2">Message</label>
                    <textarea class="form-control" rows="3" id="message" name="message" required data-error="Write your message"></textarea>
                    <div class="help-block with-errors"></div>
                </div>
              
                <div class="form-submit">
                    <button class="btn btn-dark" type="submit" id="form-submit"><i class="material-icons mdi mdi-message-outline"></i> Send Message</button>
                    <div id="msgSubmit" class="h3 text-center hidden"></div>
                    <div class="clearfix"></div>
                </div>
            </form>
        </div>
    </div>
    --}}
</div>
@endsection
