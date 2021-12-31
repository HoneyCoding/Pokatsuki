package com.dd3557.pokatsuki.activity

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.dd3557.pokatsuki.R
import com.dd3557.pokatsuki.adapter.MainRecyclerViewAdapter
import com.dd3557.pokatsuki.databinding.ActivityMainBinding
import com.dd3557.pokatsuki.model.Member

class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setupBinding()
        setupContentView()
        setupRecyclerView()
    }

    private fun setupBinding() {
        this.binding = ActivityMainBinding.inflate(layoutInflater)
    }

    private fun setupContentView() {
        val contentView = binding.root
        setContentView(contentView)

    }

    private fun setupRecyclerView() {
        val itemDataList = arrayOf<Member>(
            Member(
                name = "윤원상",
                description = "ㅈㅌ형 제발 구원좀 이러다다죽어~",
                imageResourceUrl = R.drawable.profile_image_wonsang
            ),
            Member(
                name = "김진태",
                description = """_?????????????????????????????
                                 _나 뭔가 했어?!
                                 """.trimMargin("_")),
            Member(
                name = "문건하",
                description = "메이플해야됨ㅅㄱ"),
            Member(
                name = "박경호",
                description = "@이후영 라프텔이라는 서비스 들어봤어?",
                imageResourceUrl = R.drawable.profile_image_gyeongho),
            Member(
                name = "이후영",
                description = "그걸 어디서 듣고 온 거야 ㄷ"),
            Member(
                name = "누리",
                description = "ㅎㅇㅂㅂ",
                imageResourceUrl = R.drawable.profile_image_nuri
            )
        )
        var repeatedItemDataList = arrayOf<Member>()
        repeat(5) {
            repeatedItemDataList += itemDataList
        }
        binding.mainRecyclerView.adapter = MainRecyclerViewAdapter(repeatedItemDataList)
        binding.mainRecyclerView.layoutManager = LinearLayoutManager(this)
    }
}