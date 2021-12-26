package com.dd3557.pokatsuki.activity

import android.content.res.ColorStateList
import android.graphics.Color
import android.os.Bundle
import androidx.annotation.DrawableRes
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.setPadding
import com.dd3557.pokatsuki.R
import com.dd3557.pokatsuki.databinding.ActivityDetailBinding

class DetailActivity: AppCompatActivity() {

    private var name: String? = null
    private var description: String? = null
    @DrawableRes private var imageResourceUrl: Int? = null

    private lateinit var binding: ActivityDetailBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setupBinding()
        setupContentView()
        setupPassedData()
        setupChildViews()
    }

    private fun setupBinding() {
        binding = ActivityDetailBinding.inflate(layoutInflater)
    }

    private fun setupContentView() {
        val contentView = binding.root
        setContentView(contentView)
    }

    private fun setupPassedData() {
        if (intent.hasExtra("name")) {
            this.name = intent.getStringExtra("name")
        }
        if (intent.hasExtra("description")) {
            this.description = intent.getStringExtra("description")
        }
        if (intent.hasExtra("imageResourceUrl")) {
            val passedImageResourceUrl = intent.getIntExtra("imageResourceUrl", -1)
            this.imageResourceUrl =
                if (passedImageResourceUrl != -1) passedImageResourceUrl else null
        }
    }

    private fun setupChildViews() {
        this.name?.let {
            binding.detailNameTextView.text = it
        }
        this.description?.let {
            binding.detailDescriptionTextView.text = it
        }
        binding.detailProfileImageView.apply {
            this.clipToOutline = true
            imageResourceUrl?.let {
                this.setImageResource(it)
                this.setPadding(0)
                this.imageTintList = null
            } ?: run {
                setImageResource(R.drawable.round_person_black_48)
                setPadding(8)
                imageTintList =
                    ColorStateList.valueOf(Color.parseColor("#66000000"))
            }
        }
    }
}