class User {
   final int? userId;
   String firstName;
   String lastName;
   String? phoneNumber;
   String email;
   String? password_;
   final bool? alreadyAddedGarden;
   final bool createdWithGoogle;
   String token;

   User(
       this.firstName,
       this.lastName,
       this.email,
       this.createdWithGoogle,
       this.token,
       [
        this.password_,
        this.phoneNumber,
        this.alreadyAddedGarden,
        this.userId,
       ]
    );

   @override
  String toString() {
    return 'User {\n id: $userId,\n firstName: $firstName,\n lastName: $lastName,\n email: $email,\n phoneNumber: $phoneNumber,\n alreadyAddedGarden: $alreadyAddedGarden,\n createdWithGoogle: $createdWithGoogle,\n token: $token\n}';
  }
}

