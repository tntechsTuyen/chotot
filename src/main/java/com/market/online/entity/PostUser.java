package com.market.online.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "post_user")
public class PostUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "id_post")
    private Integer idPost;

    @Column(name = "id_user")
    private Integer idUser;

    @Column(name = "had_view")
    private Integer hadView = 1;

    @Column(name = "had_like")
    private Integer hadLike = 0;

    @Column(name = "had_follow")
    private Integer hadFollow = 0;

    public Integer getHadView() {
        return hadView;
    }

    public void setHadView(boolean hadView) {
        this.hadView = (hadView) ? 1 : 0;
    }

    public boolean getHadLike() {
        return hadLike.equals(1);
    }

    public void setHadLike(boolean hadLike) {
        this.hadLike = hadLike ? 1 : 0;
    }

    public boolean getHadFollow() {
        return hadFollow.equals(1);
    }

    public void setHadFollow(boolean hadFollow) {
        this.hadFollow = hadFollow ? 1 : 0;
    }
}