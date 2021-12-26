package com.dd3557.pokatsuki.model

import androidx.annotation.DrawableRes

data class Member(val name: String, val description: String, @DrawableRes val imageResourceUrl: Int? = null)
