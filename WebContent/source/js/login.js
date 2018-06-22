      $(document).ready(function() {
            $(".login-link").on("click", showLogin);
            $(".signup-link").on("click", showSignup);
        });

        var showLogin = function showLogin() {
            $(".login-link").addClass("active");
            $(".signup-link").removeClass("active");
            $(".confirm-password-row").hide();
            $(".btn-login").text("Log in");
            $(".forgot-password-row").show();
        };

        var showSignup = function showSignup() {
            $(".signup-link").addClass("active");
            $(".login-link").removeClass("active");
            $(".btn-login").text("Sign up");
            $(".forgot-password-row").hide();
            $(".confirm-password-row").show();
        };

        $("#password").on("input focus", checkPasswordStrength).on("blur", function() {
            return $("#password-strength, .help-text").empty();
        });

        function checkPasswordStrength() {
            if (!$("#password").val() || $(".login-link").hasClass("active")) return;

            var result = zxcvbn($("#password").val());
            var emoji = {
                0: "\uD83D\uDE28", // Fearful 😨
                1: "\uD83D\uDE16", // Confounded 😖
                2: "\uD83D\uDE1E", // Disappointed 😞
                3: "\uD83D\uDE15", // Confused 😕
                4: "\uD83D\uDE03" // Grinning 😃
            };
            var warning = result.feedback.warning || "";
            var suggestion = result.feedback.suggestions.join(", ").replace(/,/g, "") || "";

            $("#password-strength").html(emoji[result.score]);
            $(".help-text").text(suggestion + " " + warning);
        }
        