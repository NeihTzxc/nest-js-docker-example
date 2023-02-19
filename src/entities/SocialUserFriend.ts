import { Column, Entity, Index } from "typeorm";

@Index("social_user_friend_pkey", ["id"], { unique: true })
@Entity("social_user_friend", { schema: "public" })
export class SocialUserFriend {
  @Column("bigint", { primary: true, name: "id" })
  id: string;

  @Column("timestamp without time zone", {
    name: "created_at",
    nullable: true,
    default: () => "now()",
  })
  createdAt: Date | null;

  @Column("timestamp without time zone", {
    name: "updated_at",
    nullable: true,
    default: () => "now()",
  })
  updatedAt: Date | null;

  @Column("bigint", { name: "user_id" })
  userId: string;

  @Column("bigint", { name: "friend_id" })
  friendId: string;

  @Column("smallint", { name: "source", nullable: true })
  source: number | null;

  @Column("smallint", { name: "status", nullable: true })
  status: number | null;
}
