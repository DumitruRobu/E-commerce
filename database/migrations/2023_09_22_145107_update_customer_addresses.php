<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('customer_addresses', function (Blueprint $table) {
            $table -> string("last_name") -> nullable() -> change();
            $table -> string("email") -> nullable() -> change();
            $table -> string("mobile") -> nullable() -> change();
            $table -> foreignId("country_id") -> constrained() -> onDelete("cascade") -> nullable() -> change();
            $table -> text("address") -> nullable() -> change();
            $table->string('apartment') -> nullable() -> change();
            $table->string('city') -> nullable() -> change();
            $table->string('state') -> nullable() -> change();
            $table->string('zip') -> nullable() -> change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('customer_addresses', function (Blueprint $table) {
            $table -> string("last_name") -> nullable(false) -> change();
            $table -> string("email") -> nullable(false) -> change();
            $table -> string("mobile") -> nullable(false) -> change();
            $table -> foreignId("country_id") -> constrained() -> onDelete("cascade") -> nullable(false) -> change();
            $table -> text("address") -> nullable(false) -> change();
            $table -> string('apartment') -> nullable(false) -> change();
            $table -> string('city') -> nullable(false) -> change();
            $table -> string('state') -> nullable(false)->change();
            $table -> string('zip') -> nullable(false)->change();
        });
        
    }
};
