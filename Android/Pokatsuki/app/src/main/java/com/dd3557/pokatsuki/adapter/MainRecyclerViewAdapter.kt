package com.dd3557.pokatsuki.adapter

import android.content.Context
import android.content.Intent
import android.content.res.ColorStateList
import android.graphics.Color
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.core.content.ContextCompat
import androidx.core.view.setPadding
import androidx.recyclerview.widget.RecyclerView
import com.dd3557.pokatsuki.R
import com.dd3557.pokatsuki.activity.DetailActivity
import com.dd3557.pokatsuki.model.Member

class MainRecyclerViewAdapter(private val itemDataList: Array<Member>): RecyclerView.Adapter<MainRecyclerViewAdapter.MainItemViewHolder>() {

    class MainItemViewHolder(itemView: View): RecyclerView.ViewHolder(itemView) {
        val profileImageView: ImageView = itemView.findViewById(R.id.mainProfileImageView)
        val nameTextView: TextView = itemView.findViewById(R.id.mainNameTextView)
        val descriptionTextView: TextView = itemView.findViewById(R.id.mainDescriptionTextView)

        init {
            profileImageView.clipToOutline = true
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MainItemViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_main, parent, false)
        return MainItemViewHolder(view)
    }

    override fun onBindViewHolder(holder: MainItemViewHolder, position: Int) {
        val itemData = itemDataList[position]
        setupProfileImageView(holder.profileImageView, itemData)
        holder.nameTextView.text = itemData.name
        holder.descriptionTextView.text = itemData.description
        setupItemOnClickListener(holder.itemView, itemData)
    }

    override fun getItemCount(): Int {
        return itemDataList.size
    }

    private fun setupProfileImageView(profileImageView: ImageView, itemData: Member) {
        if (itemData.imageResourceUrl != null) {
            profileImageView.setImageResource(itemData.imageResourceUrl)
            profileImageView.setPadding(0)
            profileImageView.imageTintList = null
        } else {
            profileImageView.setImageResource(R.drawable.round_person_black_48)
            profileImageView.setPadding(8)
            profileImageView.imageTintList =
                ColorStateList.valueOf(Color.parseColor("#66000000"))
        }
        profileImageView.contentDescription = "${itemData.name}의 프로필 이미지"
    }

    private fun setupItemOnClickListener(itemView: View, itemData: Member) {
        itemView.setOnClickListener {
            val detailIntent = Intent(it.context, DetailActivity::class.java)
            detailIntent.apply {
                this.putExtra("name", itemData.name)
                this.putExtra("description", itemData.description)
                this.putExtra("imageResourceUrl", itemData.imageResourceUrl)
            }
            ContextCompat.startActivity(it.context, detailIntent, null)
        }
    }
}